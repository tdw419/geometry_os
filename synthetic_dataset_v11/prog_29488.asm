; DESCRIPTION: Renders a green line between points (50, 33) and (239, 52).
; PLAN: r0=50(x1), r1=33(y1), r2=239(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 33
LDI r2, 239
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
