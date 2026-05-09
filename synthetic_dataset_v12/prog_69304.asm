; DESCRIPTION: Renders a green line between points (254, 206) and (31, 231).
; PLAN: r0=254(x1), r1=206(y1), r2=31(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 206
LDI r2, 31
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
