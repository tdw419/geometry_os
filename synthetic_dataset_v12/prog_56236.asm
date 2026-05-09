; DESCRIPTION: Places a cyan line segment connecting (206, 45) to (291, 11).
; PLAN: r0=206(x1), r1=45(y1), r2=291(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 45
LDI r2, 291
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
