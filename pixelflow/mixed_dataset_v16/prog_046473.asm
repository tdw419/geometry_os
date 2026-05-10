; DESCRIPTION: Composite: Creates a blue circular shape at (70, 100) with radius 34 then Sets a single red pixel at (228, 95) then Draws a white line from (110, 16) to (411, 0).
; PLAN: r0=70(x), r1=100(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=228(x), r6=95(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=110(x1), r11=16(y1), r12=411(x2), r13=0(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 70
LDI r1, 100
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 228
LDI r6, 95
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 110
LDI r11, 16
LDI r12, 411
LDI r13, 0
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
