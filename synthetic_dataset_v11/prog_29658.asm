; DESCRIPTION: Renders a green line between points (224, 120) and (52, 82).
; PLAN: r0=224(x1), r1=120(y1), r2=52(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 120
LDI r2, 52
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
