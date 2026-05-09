; DESCRIPTION: Places a black line segment connecting (365, 179) to (434, 40).
; PLAN: r0=365(x1), r1=179(y1), r2=434(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 179
LDI r2, 434
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
