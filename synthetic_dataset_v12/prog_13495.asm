; DESCRIPTION: Places a cyan line segment connecting (69, 181) to (402, 244).
; PLAN: r0=69(x1), r1=181(y1), r2=402(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 181
LDI r2, 402
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
