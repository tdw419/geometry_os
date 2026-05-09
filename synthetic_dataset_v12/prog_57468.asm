; DESCRIPTION: Renders a white line between points (90, 9) and (128, 168).
; PLAN: r0=90(x1), r1=9(y1), r2=128(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 9
LDI r2, 128
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
