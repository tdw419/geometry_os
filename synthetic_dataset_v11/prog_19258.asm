; DESCRIPTION: Places a green line segment connecting (27, 173) to (13, 56).
; PLAN: r0=27(x1), r1=173(y1), r2=13(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 173
LDI r2, 13
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
