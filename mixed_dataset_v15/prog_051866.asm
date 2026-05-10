; DESCRIPTION: Places a yellow dot at position (175, 192).
; PLAN: r0=175(x), r1=192(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 175
LDI r1, 192
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
