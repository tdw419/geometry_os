; DESCRIPTION: Places a green line segment connecting (165, 108) to (11, 143).
; PLAN: r0=165(x1), r1=108(y1), r2=11(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 108
LDI r2, 11
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
