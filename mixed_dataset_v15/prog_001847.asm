; DESCRIPTION: Renders a white line between points (303, 21) and (338, 128).
; PLAN: r0=303(x1), r1=21(y1), r2=338(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 21
LDI r2, 338
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
