; DESCRIPTION: Composite: . Then Draws a blue rectangle at (58, 108) with width 29 and height 97. Then Renders a orange line between points (184, 249) and (171, 134).
; PLAN: r0=58(x), r1=108(y), r2=29(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=184(x1), r1=249(y1), r2=171(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue rectangle at (58, 108) with width 29 and height 97.
; PLAN: r0=58(x), r1=108(y), r2=29(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 108
LDI r2, 29
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange line between points (184, 249) and (171, 134).
; PLAN: r0=184(x1), r1=249(y1), r2=171(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 249
LDI r2, 171
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
