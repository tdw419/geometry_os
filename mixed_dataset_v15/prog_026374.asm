; DESCRIPTION: Places a yellow line segment connecting (281, 116) to (346, 40).
; PLAN: r0=281(x1), r1=116(y1), r2=346(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 116
LDI r2, 346
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
