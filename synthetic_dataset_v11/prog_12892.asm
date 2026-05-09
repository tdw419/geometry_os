; DESCRIPTION: Places a cyan line segment connecting (2, 253) to (145, 198).
; PLAN: r0=2(x1), r1=253(y1), r2=145(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 253
LDI r2, 145
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
