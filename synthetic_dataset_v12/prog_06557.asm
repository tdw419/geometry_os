; DESCRIPTION: Places a magenta dot at position (371, 152).
; PLAN: r0=371(x), r1=152(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 371
LDI r1, 152
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
