; DESCRIPTION: Renders a green line between points (455, 10) and (507, 42).
; PLAN: r0=455(x1), r1=10(y1), r2=507(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 10
LDI r2, 507
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
