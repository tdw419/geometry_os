; DESCRIPTION: Places a yellow line segment connecting (464, 193) to (42, 134).
; PLAN: r0=464(x1), r1=193(y1), r2=42(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 193
LDI r2, 42
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
