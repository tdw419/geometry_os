; DESCRIPTION: Renders a green line between points (204, 248) and (333, 182).
; PLAN: r0=204(x1), r1=248(y1), r2=333(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 248
LDI r2, 333
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
