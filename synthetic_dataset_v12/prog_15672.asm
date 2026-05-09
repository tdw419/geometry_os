; DESCRIPTION: Composite: Places a green 20x30 rectangle at position (237, 171) then Draws a white line from (188, 156) to (317, 90).
; PLAN: r0=237(x), r1=171(y), r2=20(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=188(x1), r6=156(y1), r7=317(x2), r8=90(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 237
LDI r1, 171
LDI r2, 20
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 156
LDI r7, 317
LDI r8, 90
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
