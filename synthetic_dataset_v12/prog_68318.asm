; DESCRIPTION: Renders a white line between points (239, 117) and (433, 189).
; PLAN: r0=239(x1), r1=117(y1), r2=433(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 117
LDI r2, 433
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
