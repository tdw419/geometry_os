; DESCRIPTION: Composite: Places a green line segment connecting (479, 94) to (87, 112) then Sets a single orange pixel at (220, 12).
; PLAN: r0=479(x1), r1=94(y1), r2=87(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=12(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 479
LDI r1, 94
LDI r2, 87
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 12
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
