; DESCRIPTION: Renders a white line between points (56, 239) and (97, 218).
; PLAN: r0=56(x1), r1=239(y1), r2=97(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 239
LDI r2, 97
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
