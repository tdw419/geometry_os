; DESCRIPTION: Draws a cyan line from (166, 73) to (89, 98).
; PLAN: r0=166(x1), r1=73(y1), r2=89(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 73
LDI r2, 89
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
