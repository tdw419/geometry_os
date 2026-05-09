; DESCRIPTION: Composite: . Then Draws a purple rectangle at (187, 4) with width 69 and height 24. Then Renders a cyan disk with center (65, 93) and radius 15.
; PLAN: r0=187(x), r1=4(y), r2=69(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=65(x), r1=93(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple rectangle at (187, 4) with width 69 and height 24.
; PLAN: r0=187(x), r1=4(y), r2=69(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 4
LDI r2, 69
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan disk with center (65, 93) and radius 15.
; PLAN: r0=65(x), r1=93(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 93
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
