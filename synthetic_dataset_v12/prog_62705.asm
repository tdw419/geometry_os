; DESCRIPTION: Renders a green line between points (78, 113) and (284, 65).
; PLAN: r0=78(x1), r1=113(y1), r2=284(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 113
LDI r2, 284
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
