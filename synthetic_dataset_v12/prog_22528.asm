; DESCRIPTION: Places a white line segment connecting (435, 145) to (434, 27).
; PLAN: r0=435(x1), r1=145(y1), r2=434(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 145
LDI r2, 434
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
