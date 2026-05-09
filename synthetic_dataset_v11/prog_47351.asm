; DESCRIPTION: Draws a cyan line from (9, 137) to (216, 231).
; PLAN: r0=9(x1), r1=137(y1), r2=216(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 137
LDI r2, 216
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
