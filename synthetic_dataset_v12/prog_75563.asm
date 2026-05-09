; DESCRIPTION: Places a magenta line segment connecting (278, 45) to (98, 55).
; PLAN: r0=278(x1), r1=45(y1), r2=98(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 45
LDI r2, 98
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
