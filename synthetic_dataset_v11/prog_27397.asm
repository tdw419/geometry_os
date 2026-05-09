; DESCRIPTION: Renders a orange line between points (208, 103) and (161, 215).
; PLAN: r0=208(x1), r1=103(y1), r2=161(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 103
LDI r2, 161
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
