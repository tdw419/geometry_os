; DESCRIPTION: Composite: Renders a red disk with center (366, 193) and radius 21 then Draws a cyan line from (337, 95) to (122, 222).
; PLAN: r0=366(x), r1=193(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=337(x1), r6=95(y1), r7=122(x2), r8=222(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 193
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 337
LDI r6, 95
LDI r7, 122
LDI r8, 222
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
