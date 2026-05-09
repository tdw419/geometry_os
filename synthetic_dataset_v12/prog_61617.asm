; DESCRIPTION: Composite: Renders a orange box of size 44x111 starting at (264, 106) then Places a cyan line segment connecting (342, 139) to (132, 30).
; PLAN: r0=264(x), r1=106(y), r2=44(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x1), r6=139(y1), r7=132(x2), r8=30(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 106
LDI r2, 44
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 139
LDI r7, 132
LDI r8, 30
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
