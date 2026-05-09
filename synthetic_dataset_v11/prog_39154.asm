; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (97, 133) with radius 65. Then Renders a red box of size 26x51 starting at (147, 122).
; PLAN: r0=97(x), r1=133(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=147(x), r1=122(y), r2=26(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (97, 133) with radius 65.
; PLAN: r0=97(x), r1=133(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 133
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red box of size 26x51 starting at (147, 122).
; PLAN: r0=147(x), r1=122(y), r2=26(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 122
LDI r2, 26
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
