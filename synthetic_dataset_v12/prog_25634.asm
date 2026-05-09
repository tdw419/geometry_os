; DESCRIPTION: Renders a orange line between points (218, 68) and (82, 253).
; PLAN: r0=218(x1), r1=68(y1), r2=82(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 68
LDI r2, 82
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
