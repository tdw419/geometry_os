; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (181, 125) with radius 59. Then Draws a white rectangle at (90, 146) with width 85 and height 110.
; PLAN: r0=181(x), r1=125(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=90(x), r1=146(y), r2=85(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan circular shape at (181, 125) with radius 59.
; PLAN: r0=181(x), r1=125(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 125
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white rectangle at (90, 146) with width 85 and height 110.
; PLAN: r0=90(x), r1=146(y), r2=85(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 146
LDI r2, 85
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
