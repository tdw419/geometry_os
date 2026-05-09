; DESCRIPTION: Renders a orange line between points (116, 214) and (12, 215).
; PLAN: r0=116(x1), r1=214(y1), r2=12(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 214
LDI r2, 12
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
