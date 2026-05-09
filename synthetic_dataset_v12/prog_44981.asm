; DESCRIPTION: Creates a cyan circular shape at (365, 205) with radius 51.
; PLAN: r0=365(x), r1=205(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 205
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
