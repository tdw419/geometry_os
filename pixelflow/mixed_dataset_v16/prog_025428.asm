; DESCRIPTION: Draws a cyan line from (337, 137) to (8, 38).
; PLAN: r0=337(x1), r1=137(y1), r2=8(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 137
LDI r2, 8
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
