; DESCRIPTION: Draws a green line from (106, 173) to (58, 173).
; PLAN: r0=106(x1), r1=173(y1), r2=58(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 173
LDI r2, 58
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
