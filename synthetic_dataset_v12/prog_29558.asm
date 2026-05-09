; DESCRIPTION: Renders a orange line between points (239, 67) and (174, 208).
; PLAN: r0=239(x1), r1=67(y1), r2=174(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 67
LDI r2, 174
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
