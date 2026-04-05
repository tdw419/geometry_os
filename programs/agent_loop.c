/* agent_loop.c -- AIPM agent loop transpiled to .glyph assembly
 *
 * Implements the core AIPM agent loop:
 *   1. Read iteration_count and best_fitness from status
 *   2. Generate a mutation seed using LCG: seed = seed * 1103515245 + 12345
 *   3. Write the new seed back
 *   4. Compare fitness vs threshold
 *   5. If converged, return 0; if max iterations hit, return 1
 *
 * In a real environment, STATUS_READ/STATUS_WRITE commands would go through
 * __geo_cmd(). Since the transpiler maps to pure register operations, this
 * program simulates the agent loop logic with local variables.
 *
 * Registers used:
 *   r0 (input/return): initial_seed -> result code (0=converged, 1=max)
 *   r1 (input): initial_fitness
 *   r2 (input): threshold
 */

/* LCG mutation seed generator */
int lcg_next(int seed) {
    /* seed = seed * 1103515245 + 12345 */
    /* Split multiplication to avoid overflow in 32-bit:
       We use repeated addition since the transpiler supports MUL.
       1103515245 fits in 32 bits. */
    int result;
    result = seed * 1103515245;
    result = result + 12345;
    return result;
}

/* Check if fitness meets threshold */
int is_converged(int fitness, int threshold) {
    if (fitness > threshold) {
        return 1;
    } else {
        return 0;
    }
}

/* Main agent loop.
 * r0 = initial_seed
 * r1 = initial_fitness
 * r2 = threshold
 * Returns in r0: 0 = converged, 1 = max iterations reached
 */
int main(int initial_seed, int initial_fitness, int threshold) {
    int iteration;
    int seed;
    int fitness;
    int max_iterations;
    int converged;

    iteration = 0;
    seed = initial_seed;
    fitness = initial_fitness;
    max_iterations = 100;
    converged = 0;

    while (iteration < max_iterations) {
        /* Step 1: Read status (simulated -- fitness is already in register) */

        /* Step 2: Generate mutation seed via LCG */
        seed = lcg_next(seed);

        /* Step 3: Mutate fitness (simulated: add low byte of seed as variation) */
        /* This simulates running a mutation and measuring its fitness */
        fitness = fitness + (seed % 7) - 3;

        /* Step 4: Write new seed back to status (simulated -- stored in register) */

        /* Step 5: Check convergence */
        converged = is_converged(fitness, threshold);
        if (converged) {
            /* Return 0 = success (converged before max iterations) */
            return 0;
        }

        /* Yield between iterations (in real VM, this would be __geo_yield()) */
        iteration = iteration + 1;
    }

    /* Max iterations reached without convergence */
    return 1;
}
