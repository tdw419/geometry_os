; DESCRIPTION: Composite: Renders a yellow line between points (367, 119) and (408, 206) then Renders a white box of size 75x59 starting at (122, 63).
; PLAN: r0=367(x1), r1=119(y1), r2=408(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=122(x), r6=63(y), r7=75(width), r8=59(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 367
LDI r1, 119
LDI r2, 408
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 63
LDI r7, 75
LDI r8, 59
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
