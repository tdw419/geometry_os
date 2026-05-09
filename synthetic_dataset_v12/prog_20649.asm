; DESCRIPTION: Draws a cyan line from (347, 103) to (62, 118).
; PLAN: r0=347(x1), r1=103(y1), r2=62(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 103
LDI r2, 62
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
