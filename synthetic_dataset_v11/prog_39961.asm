; DESCRIPTION: Renders a white line between points (115, 239) and (229, 220).
; PLAN: r0=115(x1), r1=239(y1), r2=229(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 239
LDI r2, 229
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
