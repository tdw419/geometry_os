; DESCRIPTION: Composite: Renders a red line between points (317, 233) and (221, 172) then Renders a cyan box of size 52x40 starting at (440, 176) then Sets a single yellow pixel at (111, 124).
; PLAN: r0=317(x1), r1=233(y1), r2=221(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=440(x), r6=176(y), r7=52(width), r8=40(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=111(x), r11=124(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 317
LDI r1, 233
LDI r2, 221
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 176
LDI r7, 52
LDI r8, 40
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 124
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
