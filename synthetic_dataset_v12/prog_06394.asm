; DESCRIPTION: Composite: Places a orange dot at position (193, 64) then Places a green line segment connecting (291, 0) to (46, 155).
; PLAN: r0=193(x), r1=64(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=291(x1), r6=0(y1), r7=46(x2), r8=155(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 64
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 291
LDI r6, 0
LDI r7, 46
LDI r8, 155
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
