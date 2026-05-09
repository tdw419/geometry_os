; DESCRIPTION: Renders a green line between points (230, 85) and (42, 70).
; PLAN: r0=230(x1), r1=85(y1), r2=42(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 85
LDI r2, 42
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
