; DESCRIPTION: Composite: Draws a blue rectangle at (406, 93) with width 97 and height 75 then Draws a black line from (280, 225) to (14, 117).
; PLAN: r0=406(x), r1=93(y), r2=97(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x1), r6=225(y1), r7=14(x2), r8=117(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 93
LDI r2, 97
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 225
LDI r7, 14
LDI r8, 117
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
