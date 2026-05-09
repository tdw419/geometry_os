; DESCRIPTION: Composite: Places a cyan line segment connecting (389, 244) to (42, 60) then Places a orange circle of radius 12 at center (432, 210).
; PLAN: r0=389(x1), r1=244(y1), r2=42(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=432(x), r6=210(y), r7=12(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 389
LDI r1, 244
LDI r2, 42
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 210
LDI r7, 12
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
