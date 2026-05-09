; DESCRIPTION: Composite: Places a orange line segment connecting (251, 10) to (430, 221) then Places a black 47x81 rectangle at position (17, 11) then Places a red dot at position (199, 193).
; PLAN: r0=251(x1), r1=10(y1), r2=430(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=17(x), r6=11(y), r7=47(width), r8=81(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=199(x), r11=193(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 251
LDI r1, 10
LDI r2, 430
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 11
LDI r7, 47
LDI r8, 81
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 193
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
