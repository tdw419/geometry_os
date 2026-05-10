; DESCRIPTION: Composite: Renders a cyan box of size 40x46 starting at (417, 1) then Places a red line segment connecting (233, 249) to (40, 141).
; PLAN: r0=417(x), r1=1(y), r2=40(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x1), r6=249(y1), r7=40(x2), r8=141(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 417
LDI r1, 1
LDI r2, 40
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 249
LDI r7, 40
LDI r8, 141
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
