; DESCRIPTION: Composite: Places a purple line segment connecting (356, 68) to (303, 124) then Places a cyan dot at position (351, 46).
; PLAN: r0=356(x1), r1=68(y1), r2=303(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=351(x), r6=46(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 356
LDI r1, 68
LDI r2, 303
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 46
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
