; DESCRIPTION: Renders a yellow line between points (196, 127) and (218, 190).
; PLAN: r0=196(x1), r1=127(y1), r2=218(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 127
LDI r2, 218
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
