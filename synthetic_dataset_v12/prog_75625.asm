; DESCRIPTION: Renders a yellow line between points (59, 242) and (296, 33).
; PLAN: r0=59(x1), r1=242(y1), r2=296(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 242
LDI r2, 296
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
