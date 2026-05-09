; DESCRIPTION: Places a yellow line segment connecting (240, 205) to (151, 215).
; PLAN: r0=240(x1), r1=205(y1), r2=151(x2), r3=215(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 205
LDI r2, 151
LDI r3, 215
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
