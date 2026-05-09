; DESCRIPTION: Composite: Places a cyan line segment connecting (138, 164) to (90, 227) then Renders a magenta box of size 54x97 starting at (319, 71).
; PLAN: r0=138(x1), r1=164(y1), r2=90(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=319(x), r6=71(y), r7=54(width), r8=97(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 164
LDI r2, 90
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 71
LDI r7, 54
LDI r8, 97
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
