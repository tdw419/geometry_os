; DESCRIPTION: Places a green line segment connecting (491, 223) to (464, 76).
; PLAN: r0=491(x1), r1=223(y1), r2=464(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 223
LDI r2, 464
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
