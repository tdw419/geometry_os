; DESCRIPTION: Places a green line segment connecting (254, 113) to (195, 143).
; PLAN: r0=254(x1), r1=113(y1), r2=195(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 113
LDI r2, 195
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
