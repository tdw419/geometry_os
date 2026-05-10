; DESCRIPTION: Renders a orange line between points (490, 154) and (70, 228).
; PLAN: r0=490(x1), r1=154(y1), r2=70(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 154
LDI r2, 70
LDI r3, 228
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
