; DESCRIPTION: Places a green line segment connecting (186, 128) to (121, 59).
; PLAN: r0=186(x1), r1=128(y1), r2=121(x2), r3=59(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 128
LDI r2, 121
LDI r3, 59
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
