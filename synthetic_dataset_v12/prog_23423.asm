; DESCRIPTION: Draws a green line from (56, 0) to (408, 16).
; PLAN: r0=56(x1), r1=0(y1), r2=408(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 0
LDI r2, 408
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
