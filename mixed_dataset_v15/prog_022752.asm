; DESCRIPTION: Composite: Sets a single red pixel at (423, 239) then Renders a blue box of size 31x61 starting at (398, 3) then Draws a cyan line from (473, 238) to (179, 54).
; PLAN: r0=423(x), r1=239(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=398(x), r6=3(y), r7=31(width), r8=61(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=473(x1), r11=238(y1), r12=179(x2), r13=54(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 239
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 398
LDI r6, 3
LDI r7, 31
LDI r8, 61
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 473
LDI r11, 238
LDI r12, 179
LDI r13, 54
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
