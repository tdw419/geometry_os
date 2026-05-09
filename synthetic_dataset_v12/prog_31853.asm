; DESCRIPTION: Renders a white line between points (153, 229) and (239, 73).
; PLAN: r0=153(x1), r1=229(y1), r2=239(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 229
LDI r2, 239
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
