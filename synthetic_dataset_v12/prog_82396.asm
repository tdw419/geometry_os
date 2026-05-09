; DESCRIPTION: Draws a black line from (434, 200) to (75, 93).
; PLAN: r0=434(x1), r1=200(y1), r2=75(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 200
LDI r2, 75
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
