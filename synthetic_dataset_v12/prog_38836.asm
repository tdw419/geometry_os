; DESCRIPTION: Composite: Places a yellow line segment connecting (253, 80) to (207, 60) then Renders a green box of size 43x40 starting at (12, 48).
; PLAN: r0=253(x1), r1=80(y1), r2=207(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=12(x), r6=48(y), r7=43(width), r8=40(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 80
LDI r2, 207
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 48
LDI r7, 43
LDI r8, 40
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
