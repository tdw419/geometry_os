; DESCRIPTION: Renders a yellow line between points (295, 116) and (492, 148).
; PLAN: r0=295(x1), r1=116(y1), r2=492(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 116
LDI r2, 492
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
