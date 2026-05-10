; DESCRIPTION: Places a yellow line segment connecting (346, 149) to (87, 131).
; PLAN: r0=346(x1), r1=149(y1), r2=87(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 149
LDI r2, 87
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
