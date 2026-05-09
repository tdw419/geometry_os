; DESCRIPTION: Renders a white line between points (128, 240) and (347, 187).
; PLAN: r0=128(x1), r1=240(y1), r2=347(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 240
LDI r2, 347
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
