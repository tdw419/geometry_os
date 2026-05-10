; DESCRIPTION: Renders a orange line between points (103, 152) and (108, 195).
; PLAN: r0=103(x1), r1=152(y1), r2=108(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 152
LDI r2, 108
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
