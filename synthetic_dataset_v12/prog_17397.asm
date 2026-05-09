; DESCRIPTION: Places a magenta dot at position (412, 227).
; PLAN: r0=412(x), r1=227(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 412
LDI r1, 227
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
