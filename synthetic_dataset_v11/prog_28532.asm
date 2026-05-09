; DESCRIPTION: Renders a green line between points (73, 127) and (239, 150).
; PLAN: r0=73(x1), r1=127(y1), r2=239(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 127
LDI r2, 239
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
