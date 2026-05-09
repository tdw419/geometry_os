; DESCRIPTION: Composite: Places a orange 84x66 rectangle at position (99, 174) then Places a red line segment connecting (436, 115) to (286, 157).
; PLAN: r0=99(x), r1=174(y), r2=84(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x1), r6=115(y1), r7=286(x2), r8=157(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 99
LDI r1, 174
LDI r2, 84
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 115
LDI r7, 286
LDI r8, 157
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
