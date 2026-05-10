; DESCRIPTION: Places a yellow line segment connecting (72, 205) to (103, 236).
; PLAN: r0=72(x1), r1=205(y1), r2=103(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 205
LDI r2, 103
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
