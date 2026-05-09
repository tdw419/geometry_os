; DESCRIPTION: Composite: Places a blue line segment connecting (386, 205) to (317, 131) then Renders a green box of size 19x97 starting at (186, 137).
; PLAN: r0=386(x1), r1=205(y1), r2=317(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=137(y), r7=19(width), r8=97(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 386
LDI r1, 205
LDI r2, 317
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 137
LDI r7, 19
LDI r8, 97
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
