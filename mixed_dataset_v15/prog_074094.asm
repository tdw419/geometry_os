; DESCRIPTION: Composite: Renders a black box of size 21x28 starting at (172, 90) then Places a red line segment connecting (106, 215) to (213, 183).
; PLAN: r0=172(x), r1=90(y), r2=21(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x1), r6=215(y1), r7=213(x2), r8=183(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 90
LDI r2, 21
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 215
LDI r7, 213
LDI r8, 183
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
