; DESCRIPTION: Composite: Renders a white box of size 98x87 starting at (223, 35) then Places a green dot at position (10, 25) then Renders a cyan line between points (383, 137) and (389, 148).
; PLAN: r0=223(x), r1=35(y), r2=98(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=10(x), r6=25(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=383(x1), r11=137(y1), r12=389(x2), r13=148(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 223
LDI r1, 35
LDI r2, 98
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 25
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 383
LDI r11, 137
LDI r12, 389
LDI r13, 148
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
