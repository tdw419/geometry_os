; DESCRIPTION: Composite: Places a white line segment connecting (98, 91) to (321, 23) then Renders a blue box of size 42x44 starting at (20, 180).
; PLAN: r0=98(x1), r1=91(y1), r2=321(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=20(x), r6=180(y), r7=42(width), r8=44(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 91
LDI r2, 321
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 180
LDI r7, 42
LDI r8, 44
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
