; DESCRIPTION: Draws a cyan line from (106, 17) to (76, 207).
; PLAN: r0=106(x1), r1=17(y1), r2=76(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 17
LDI r2, 76
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
