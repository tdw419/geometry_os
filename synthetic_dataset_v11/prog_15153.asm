; DESCRIPTION: Renders a white line between points (239, 209) and (95, 122).
; PLAN: r0=239(x1), r1=209(y1), r2=95(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 209
LDI r2, 95
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
