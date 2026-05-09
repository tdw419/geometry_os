; DESCRIPTION: Renders a orange line between points (209, 168) and (168, 221).
; PLAN: r0=209(x1), r1=168(y1), r2=168(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 168
LDI r2, 168
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
