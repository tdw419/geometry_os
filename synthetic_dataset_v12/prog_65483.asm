; DESCRIPTION: Places a cyan line segment connecting (309, 45) to (298, 130).
; PLAN: r0=309(x1), r1=45(y1), r2=298(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 45
LDI r2, 298
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
