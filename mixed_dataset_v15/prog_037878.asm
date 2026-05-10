; DESCRIPTION: Draws a cyan line from (86, 22) to (216, 55).
; PLAN: r0=86(x1), r1=22(y1), r2=216(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 22
LDI r2, 216
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
