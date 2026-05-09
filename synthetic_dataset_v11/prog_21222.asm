; DESCRIPTION: Renders a green line between points (12, 75) and (42, 208).
; PLAN: r0=12(x1), r1=75(y1), r2=42(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 75
LDI r2, 42
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
