; DESCRIPTION: Renders a green line between points (162, 203) and (234, 42).
; PLAN: r0=162(x1), r1=203(y1), r2=234(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 203
LDI r2, 234
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
