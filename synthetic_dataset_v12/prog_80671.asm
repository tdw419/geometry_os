; DESCRIPTION: Draws a green line from (16, 151) to (442, 208).
; PLAN: r0=16(x1), r1=151(y1), r2=442(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 151
LDI r2, 442
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
