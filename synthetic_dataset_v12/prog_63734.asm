; DESCRIPTION: Renders a white line between points (434, 197) and (50, 10).
; PLAN: r0=434(x1), r1=197(y1), r2=50(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 197
LDI r2, 50
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
