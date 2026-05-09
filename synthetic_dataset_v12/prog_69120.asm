; DESCRIPTION: Renders a orange line between points (280, 219) and (502, 67).
; PLAN: r0=280(x1), r1=219(y1), r2=502(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 219
LDI r2, 502
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
