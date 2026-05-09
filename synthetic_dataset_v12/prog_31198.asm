; DESCRIPTION: Composite: Renders a yellow box of size 48x60 starting at (66, 55) then Sets a single red pixel at (248, 123) then Draws a cyan line from (182, 162) to (285, 6).
; PLAN: r0=66(x), r1=55(y), r2=48(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x), r6=123(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=182(x1), r11=162(y1), r12=285(x2), r13=6(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 66
LDI r1, 55
LDI r2, 48
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 123
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 182
LDI r11, 162
LDI r12, 285
LDI r13, 6
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
