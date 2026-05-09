; DESCRIPTION: Places a green line segment connecting (212, 209) to (218, 244).
; PLAN: r0=212(x1), r1=209(y1), r2=218(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 209
LDI r2, 218
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
