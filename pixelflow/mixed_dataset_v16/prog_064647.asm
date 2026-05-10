; DESCRIPTION: Renders a green line segment connecting (42, 117) to (214, 99).
; PLAN: r0=42(x1), r1=117(y1), r2=214(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 117
LDI r2, 214
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
