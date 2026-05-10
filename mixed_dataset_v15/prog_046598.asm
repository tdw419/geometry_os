; DESCRIPTION: Renders a yellow line between points (434, 56) and (317, 50).
; PLAN: r0=434(x1), r1=56(y1), r2=317(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 56
LDI r2, 317
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
