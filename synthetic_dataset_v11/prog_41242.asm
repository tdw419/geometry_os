; DESCRIPTION: Renders a green line between points (254, 129) and (209, 5).
; PLAN: r0=254(x1), r1=129(y1), r2=209(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 129
LDI r2, 209
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
