; DESCRIPTION: Renders a yellow line between points (295, 111) and (450, 189).
; PLAN: r0=295(x1), r1=111(y1), r2=450(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 111
LDI r2, 450
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
