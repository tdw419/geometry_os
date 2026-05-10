; DESCRIPTION: Renders a orange line between points (412, 121) and (104, 253).
; PLAN: r0=412(x1), r1=121(y1), r2=104(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 121
LDI r2, 104
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
