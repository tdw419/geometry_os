; DESCRIPTION: Places a yellow line segment connecting (143, 32) to (48, 28).
; PLAN: r0=143(x1), r1=32(y1), r2=48(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 32
LDI r2, 48
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
