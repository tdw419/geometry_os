; DESCRIPTION: Places a cyan line segment connecting (1, 243) to (45, 92).
; PLAN: r0=1(x1), r1=243(y1), r2=45(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 243
LDI r2, 45
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
