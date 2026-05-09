; DESCRIPTION: Renders a orange line between points (16, 152) and (416, 71).
; PLAN: r0=16(x1), r1=152(y1), r2=416(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 152
LDI r2, 416
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
