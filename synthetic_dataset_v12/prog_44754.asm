; DESCRIPTION: Draws a cyan line from (211, 91) to (342, 44).
; PLAN: r0=211(x1), r1=91(y1), r2=342(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 91
LDI r2, 342
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
