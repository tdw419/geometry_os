; DESCRIPTION: Places a yellow line segment connecting (209, 38) to (394, 222).
; PLAN: r0=209(x1), r1=38(y1), r2=394(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 38
LDI r2, 394
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
