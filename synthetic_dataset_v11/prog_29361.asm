; DESCRIPTION: Renders a orange line between points (168, 129) and (70, 221).
; PLAN: r0=168(x1), r1=129(y1), r2=70(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 129
LDI r2, 70
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
