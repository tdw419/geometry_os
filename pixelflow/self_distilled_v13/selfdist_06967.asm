; DESCRIPTION: Places a red dot at position (271, 196).
; PLAN: r0=271(x), r1=196(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 271
LDI r1, 196
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
