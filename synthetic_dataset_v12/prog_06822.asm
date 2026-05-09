; DESCRIPTION: Renders a yellow line between points (222, 239) and (463, 190).
; PLAN: r0=222(x1), r1=239(y1), r2=463(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 239
LDI r2, 463
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
