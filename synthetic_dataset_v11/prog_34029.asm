; DESCRIPTION: Composite: . Then Draws a blue rectangle at (48, 169) with width 95 and height 70. Then Draws a green circle centered at (175, 138) with radius 73.
; PLAN: r0=48(x), r1=169(y), r2=95(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=175(x), r1=138(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a blue rectangle at (48, 169) with width 95 and height 70.
; PLAN: r0=48(x), r1=169(y), r2=95(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 169
LDI r2, 95
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (175, 138) with radius 73.
; PLAN: r0=175(x), r1=138(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 138
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
