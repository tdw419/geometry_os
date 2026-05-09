; DESCRIPTION: Draws a cyan circle centered at (177, 128) with radius 41.
; PLAN: r0=177(x), r1=128(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 128
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
