; DESCRIPTION: Places a red line segment connecting (196, 32) to (417, 16).
; PLAN: r0=196(x1), r1=32(y1), r2=417(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 32
LDI r2, 417
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
