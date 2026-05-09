; DESCRIPTION: Composite: . Then Renders a yellow box of size 18x98 starting at (121, 128). Then Renders a black disk with center (175, 108) and radius 36.
; PLAN: r0=121(x), r1=128(y), r2=18(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=175(x), r1=108(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a yellow box of size 18x98 starting at (121, 128).
; PLAN: r0=121(x), r1=128(y), r2=18(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 128
LDI r2, 18
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black disk with center (175, 108) and radius 36.
; PLAN: r0=175(x), r1=108(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 108
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
