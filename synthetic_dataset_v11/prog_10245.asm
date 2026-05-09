; DESCRIPTION: Composite: . Then Draws a purple rectangle at (143, 86) with width 106 and height 120. Then Renders a cyan disk with center (66, 86) and radius 57.
; PLAN: r0=143(x), r1=86(y), r2=106(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=66(x), r1=86(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple rectangle at (143, 86) with width 106 and height 120.
; PLAN: r0=143(x), r1=86(y), r2=106(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 86
LDI r2, 106
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan disk with center (66, 86) and radius 57.
; PLAN: r0=66(x), r1=86(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 86
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
