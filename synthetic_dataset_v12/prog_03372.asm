; DESCRIPTION: Draws a green line from (412, 31) to (237, 244).
; PLAN: r0=412(x1), r1=31(y1), r2=237(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 31
LDI r2, 237
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
