; DESCRIPTION: Composite: . Then Renders a blue box of size 15x62 starting at (159, 90). Then Draws a white line from (168, 120) to (72, 36).
; PLAN: r0=159(x), r1=90(y), r2=15(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=168(x1), r1=120(y1), r2=72(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue box of size 15x62 starting at (159, 90).
; PLAN: r0=159(x), r1=90(y), r2=15(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 90
LDI r2, 15
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white line from (168, 120) to (72, 36).
; PLAN: r0=168(x1), r1=120(y1), r2=72(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 120
LDI r2, 72
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
