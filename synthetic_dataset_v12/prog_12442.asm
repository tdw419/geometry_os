; DESCRIPTION: Composite: Places a cyan 89x77 rectangle at position (203, 174) then Renders a red line between points (97, 125) and (419, 244).
; PLAN: r0=203(x), r1=174(y), r2=89(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=97(x1), r6=125(y1), r7=419(x2), r8=244(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 174
LDI r2, 89
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 125
LDI r7, 419
LDI r8, 244
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
