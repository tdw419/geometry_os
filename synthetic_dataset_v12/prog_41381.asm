; DESCRIPTION: Draws a green line from (406, 173) to (140, 184).
; PLAN: r0=406(x1), r1=173(y1), r2=140(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 173
LDI r2, 140
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
