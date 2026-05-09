; DESCRIPTION: Composite: Renders a yellow box of size 89x72 starting at (399, 176) then Places a cyan line segment connecting (20, 242) to (169, 172).
; PLAN: r0=399(x), r1=176(y), r2=89(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=20(x1), r6=242(y1), r7=169(x2), r8=172(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 399
LDI r1, 176
LDI r2, 89
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 242
LDI r7, 169
LDI r8, 172
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
