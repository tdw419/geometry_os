; DESCRIPTION: Renders a orange line between points (108, 173) and (134, 215).
; PLAN: r0=108(x1), r1=173(y1), r2=134(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 173
LDI r2, 134
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
