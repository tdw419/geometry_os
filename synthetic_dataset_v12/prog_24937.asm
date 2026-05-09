; DESCRIPTION: Composite: Places a green line segment connecting (149, 243) to (77, 109) then Places a orange 79x65 rectangle at position (427, 74).
; PLAN: r0=149(x1), r1=243(y1), r2=77(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=427(x), r6=74(y), r7=79(width), r8=65(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 149
LDI r1, 243
LDI r2, 77
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 74
LDI r7, 79
LDI r8, 65
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
