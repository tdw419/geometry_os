; DESCRIPTION: Composite: Renders a blue box of size 95x30 starting at (186, 60) then Draws a cyan line from (340, 160) to (223, 62) then Sets a single yellow pixel at (304, 193).
; PLAN: r0=186(x), r1=60(y), r2=95(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=340(x1), r6=160(y1), r7=223(x2), r8=62(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=304(x), r11=193(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 186
LDI r1, 60
LDI r2, 95
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 160
LDI r7, 223
LDI r8, 62
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 193
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
