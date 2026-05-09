; DESCRIPTION: Composite: . Then Renders a purple disk with center (154, 186) and radius 65. Then Draws a cyan rectangle at (52, 63) with width 102 and height 40.
; PLAN: r0=154(x), r1=186(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=52(x), r1=63(y), r2=102(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (154, 186) and radius 65.
; PLAN: r0=154(x), r1=186(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 186
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan rectangle at (52, 63) with width 102 and height 40.
; PLAN: r0=52(x), r1=63(y), r2=102(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 63
LDI r2, 102
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
