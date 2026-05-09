; DESCRIPTION: Renders a yellow line between points (237, 80) and (239, 174).
; PLAN: r0=237(x1), r1=80(y1), r2=239(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 80
LDI r2, 239
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
