; DESCRIPTION: Composite: . Then Draws a red rectangle at (73, 49) with width 46 and height 85. Then Draws a white circle centered at (179, 186) with radius 66.
; PLAN: r0=73(x), r1=49(y), r2=46(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=179(x), r1=186(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a red rectangle at (73, 49) with width 46 and height 85.
; PLAN: r0=73(x), r1=49(y), r2=46(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 49
LDI r2, 46
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white circle centered at (179, 186) with radius 66.
; PLAN: r0=179(x), r1=186(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 186
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
