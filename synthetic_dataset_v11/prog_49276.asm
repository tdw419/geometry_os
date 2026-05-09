; DESCRIPTION: Renders a red line between points (60, 67) and (164, 229).
; PLAN: r0=60(x1), r1=67(y1), r2=164(x2), r3=229(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 67
LDI r2, 164
LDI r3, 229
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
