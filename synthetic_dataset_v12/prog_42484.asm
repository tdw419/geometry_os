; DESCRIPTION: Renders a orange line between points (404, 129) and (146, 165).
; PLAN: r0=404(x1), r1=129(y1), r2=146(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 129
LDI r2, 146
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
