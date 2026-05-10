; DESCRIPTION: Composite: Renders a cyan box of size 83x53 starting at (234, 178) then Draws a black line from (49, 190) to (106, 40).
; PLAN: r0=234(x), r1=178(y), r2=83(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=49(x1), r6=190(y1), r7=106(x2), r8=40(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 234
LDI r1, 178
LDI r2, 83
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 190
LDI r7, 106
LDI r8, 40
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
