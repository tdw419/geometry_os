; DESCRIPTION: Composite: Places a white circle of radius 45 at center (281, 131) then Sets a single green pixel at (2, 187) then Renders a orange line between points (134, 170) and (502, 151).
; PLAN: r0=281(x), r1=131(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=2(x), r6=187(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=134(x1), r11=170(y1), r12=502(x2), r13=151(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 131
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 2
LDI r6, 187
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 134
LDI r11, 170
LDI r12, 502
LDI r13, 151
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
