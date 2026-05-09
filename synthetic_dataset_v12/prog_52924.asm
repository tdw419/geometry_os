; DESCRIPTION: Composite: Sets a single red pixel at (17, 128) then Places a blue line segment connecting (336, 220) to (290, 59).
; PLAN: r0=17(x), r1=128(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=336(x1), r6=220(y1), r7=290(x2), r8=59(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 17
LDI r1, 128
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 336
LDI r6, 220
LDI r7, 290
LDI r8, 59
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
