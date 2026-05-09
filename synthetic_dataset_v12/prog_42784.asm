; DESCRIPTION: Composite: Places a blue line segment connecting (55, 200) to (371, 254) then Places a cyan dot at position (135, 18).
; PLAN: r0=55(x1), r1=200(y1), r2=371(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=135(x), r6=18(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 55
LDI r1, 200
LDI r2, 371
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 18
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
