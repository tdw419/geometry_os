; DESCRIPTION: Renders a red line between points (196, 67) and (18, 67).
; PLAN: r0=196(x1), r1=67(y1), r2=18(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 67
LDI r2, 18
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
