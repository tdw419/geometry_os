; DESCRIPTION: Draws a cyan line from (370, 106) to (233, 87).
; PLAN: r0=370(x1), r1=106(y1), r2=233(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 106
LDI r2, 233
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
