; DESCRIPTION: Draws a green line from (166, 95) to (206, 75).
; PLAN: r0=166(x1), r1=95(y1), r2=206(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 95
LDI r2, 206
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
