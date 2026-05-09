; DESCRIPTION: Renders a green line between points (32, 82) and (439, 100).
; PLAN: r0=32(x1), r1=82(y1), r2=439(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 82
LDI r2, 439
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
