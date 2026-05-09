; DESCRIPTION: Composite: . Then Draws a green rectangle at (135, 201) with width 103 and height 48. Then Draws a red line from (87, 185) to (154, 46).
; PLAN: r0=135(x), r1=201(y), r2=103(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=87(x1), r1=185(y1), r2=154(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green rectangle at (135, 201) with width 103 and height 48.
; PLAN: r0=135(x), r1=201(y), r2=103(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 201
LDI r2, 103
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red line from (87, 185) to (154, 46).
; PLAN: r0=87(x1), r1=185(y1), r2=154(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 185
LDI r2, 154
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
