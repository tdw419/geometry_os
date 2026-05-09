; DESCRIPTION: Composite: . Then Draws a white rectangle at (107, 134) with width 98 and height 79. Then Draws a red circle centered at (187, 113) with radius 35.
; PLAN: r0=107(x), r1=134(y), r2=98(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=187(x), r1=113(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white rectangle at (107, 134) with width 98 and height 79.
; PLAN: r0=107(x), r1=134(y), r2=98(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 134
LDI r2, 98
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red circle centered at (187, 113) with radius 35.
; PLAN: r0=187(x), r1=113(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 113
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
