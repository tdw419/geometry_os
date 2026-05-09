; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (87, 41) with width 89 and height 107. Then Renders a white line between points (232, 152) and (128, 48).
; PLAN: r0=87(x), r1=41(y), r2=89(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=232(x1), r1=152(y1), r2=128(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta rectangle at (87, 41) with width 89 and height 107.
; PLAN: r0=87(x), r1=41(y), r2=89(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 41
LDI r2, 89
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white line between points (232, 152) and (128, 48).
; PLAN: r0=232(x1), r1=152(y1), r2=128(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 152
LDI r2, 128
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
