; DESCRIPTION: Renders a green line between points (191, 79) and (42, 134).
; PLAN: r0=191(x1), r1=79(y1), r2=42(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 79
LDI r2, 42
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
