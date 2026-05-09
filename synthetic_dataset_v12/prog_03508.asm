; DESCRIPTION: Places a magenta dot at position (392, 32).
; PLAN: r0=392(x), r1=32(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 392
LDI r1, 32
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
