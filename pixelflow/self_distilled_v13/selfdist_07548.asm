; DESCRIPTION: Renders a cyan circular shape at (296, 88) with radius 66.
; PLAN: r0=296(x), r1=88(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 88
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
