; DESCRIPTION: Renders a orange line between points (262, 28) and (313, 27).
; PLAN: r0=262(x1), r1=28(y1), r2=313(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 28
LDI r2, 313
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
