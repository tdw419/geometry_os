; DESCRIPTION: Composite: Sets a single green pixel at (437, 61) then Renders a cyan box of size 17x115 starting at (20, 40) then Draws a magenta line from (484, 83) to (13, 239).
; PLAN: r0=437(x), r1=61(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=20(x), r6=40(y), r7=17(width), r8=115(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=484(x1), r11=83(y1), r12=13(x2), r13=239(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 437
LDI r1, 61
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 20
LDI r6, 40
LDI r7, 17
LDI r8, 115
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 484
LDI r11, 83
LDI r12, 13
LDI r13, 239
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
