; DESCRIPTION: Creates a cyan circular shape at (46, 51) with radius 27.
; PLAN: r0=46(x), r1=51(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 51
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
