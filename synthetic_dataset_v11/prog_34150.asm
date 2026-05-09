; DESCRIPTION: Draws a green line from (237, 176) to (34, 16).
; PLAN: r0=237(x1), r1=176(y1), r2=34(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 176
LDI r2, 34
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
