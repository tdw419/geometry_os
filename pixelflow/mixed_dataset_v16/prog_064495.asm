; DESCRIPTION: Composite: Draws a blue line from (367, 89) to (373, 85) then Renders a orange box of size 94x87 starting at (163, 35).
; PLAN: r0=367(x1), r1=89(y1), r2=373(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=163(x), r6=35(y), r7=94(width), r8=87(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 367
LDI r1, 89
LDI r2, 373
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 35
LDI r7, 94
LDI r8, 87
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
