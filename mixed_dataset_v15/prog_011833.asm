; DESCRIPTION: Places a purple dot at position (269, 42).
; PLAN: r0=269(x), r1=42(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 269
LDI r1, 42
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
