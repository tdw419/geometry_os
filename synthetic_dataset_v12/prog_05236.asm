; DESCRIPTION: Renders a orange line between points (228, 62) and (340, 206).
; PLAN: r0=228(x1), r1=62(y1), r2=340(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 62
LDI r2, 340
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
