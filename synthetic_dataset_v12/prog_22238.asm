; DESCRIPTION: Renders a green line between points (239, 222) and (264, 223).
; PLAN: r0=239(x1), r1=222(y1), r2=264(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 222
LDI r2, 264
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
