; DESCRIPTION: Renders a white line between points (126, 78) and (219, 113).
; PLAN: r0=126(x1), r1=78(y1), r2=219(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 78
LDI r2, 219
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
