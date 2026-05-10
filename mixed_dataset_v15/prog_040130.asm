; DESCRIPTION: Composite: Places a black line segment connecting (428, 233) to (62, 253) then Renders a cyan box of size 116x52 starting at (215, 2) then Sets a single cyan pixel at (202, 183).
; PLAN: r0=428(x1), r1=233(y1), r2=62(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=2(y), r7=116(width), r8=52(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=202(x), r11=183(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 428
LDI r1, 233
LDI r2, 62
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 2
LDI r7, 116
LDI r8, 52
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 183
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
