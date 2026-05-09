; DESCRIPTION: Places a magenta dot at position (213, 169).
; PLAN: r0=213(x), r1=169(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 213
LDI r1, 169
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
