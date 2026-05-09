; DESCRIPTION: Composite: Renders a cyan box of size 109x22 starting at (249, 1) then Renders a yellow line between points (474, 225) and (225, 215).
; PLAN: r0=249(x), r1=1(y), r2=109(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=474(x1), r6=225(y1), r7=225(x2), r8=215(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 249
LDI r1, 1
LDI r2, 109
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 225
LDI r7, 225
LDI r8, 215
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
