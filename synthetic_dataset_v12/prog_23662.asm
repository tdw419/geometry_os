; DESCRIPTION: Composite: Sets a single cyan pixel at (508, 252) then Places a orange circle of radius 18 at center (360, 228) then Places a blue line segment connecting (79, 53) to (81, 35).
; PLAN: r0=508(x), r1=252(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=360(x), r6=228(y), r7=18(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=79(x1), r11=53(y1), r12=81(x2), r13=35(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 508
LDI r1, 252
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 360
LDI r6, 228
LDI r7, 18
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 79
LDI r11, 53
LDI r12, 81
LDI r13, 35
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
