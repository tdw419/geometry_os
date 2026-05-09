; DESCRIPTION: Composite: . Then Draws a cyan line from (185, 103) to (22, 175). Then Draws a red rectangle at (125, 147) with width 52 and height 95.
; PLAN: r0=185(x1), r1=103(y1), r2=22(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=125(x), r1=147(y), r2=52(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (185, 103) to (22, 175).
; PLAN: r0=185(x1), r1=103(y1), r2=22(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 103
LDI r2, 22
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red rectangle at (125, 147) with width 52 and height 95.
; PLAN: r0=125(x), r1=147(y), r2=52(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 147
LDI r2, 52
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
