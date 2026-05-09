; DESCRIPTION: Composite: . Then Places a green line segment connecting (154, 158) to (124, 246). Then Draws a cyan rectangle at (94, 55) with width 61 and height 97.
; PLAN: r0=154(x1), r1=158(y1), r2=124(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=94(x), r1=55(y), r2=61(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green line segment connecting (154, 158) to (124, 246).
; PLAN: r0=154(x1), r1=158(y1), r2=124(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 158
LDI r2, 124
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan rectangle at (94, 55) with width 61 and height 97.
; PLAN: r0=94(x), r1=55(y), r2=61(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 55
LDI r2, 61
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
