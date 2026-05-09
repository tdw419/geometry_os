; DESCRIPTION: Renders a yellow line between points (154, 113) and (400, 184).
; PLAN: r0=154(x1), r1=113(y1), r2=400(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 113
LDI r2, 400
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
