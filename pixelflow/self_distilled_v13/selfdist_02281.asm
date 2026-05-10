; DESCRIPTION: Places a purple dot at position (242, 196).
; PLAN: r0=242(x), r1=196(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 242
LDI r1, 196
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
