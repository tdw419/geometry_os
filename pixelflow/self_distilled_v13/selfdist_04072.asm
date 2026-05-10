; DESCRIPTION: Renders a green line segment connecting (234, 82) to (346, 85).
; PLAN: r0=234(x1), r1=82(y1), r2=346(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 82
LDI r2, 346
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
