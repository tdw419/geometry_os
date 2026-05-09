; DESCRIPTION: Composite: Creates a purple rectangular region at (409, 50) spanning 24 by 107 pixels then Draws a cyan line from (150, 145) to (86, 35).
; PLAN: r0=409(x), r1=50(y), r2=24(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=150(x1), r6=145(y1), r7=86(x2), r8=35(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 50
LDI r2, 24
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 145
LDI r7, 86
LDI r8, 35
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
