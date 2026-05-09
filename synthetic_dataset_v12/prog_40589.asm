; DESCRIPTION: Renders a yellow line between points (349, 239) and (262, 44).
; PLAN: r0=349(x1), r1=239(y1), r2=262(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 239
LDI r2, 262
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
