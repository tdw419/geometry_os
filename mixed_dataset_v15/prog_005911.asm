; DESCRIPTION: Composite: Places a red line segment connecting (408, 220) to (371, 194) then Renders a green box of size 78x30 starting at (382, 169).
; PLAN: r0=408(x1), r1=220(y1), r2=371(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=169(y), r7=78(width), r8=30(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 408
LDI r1, 220
LDI r2, 371
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 169
LDI r7, 78
LDI r8, 30
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
