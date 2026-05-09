; DESCRIPTION: Renders a blue line between points (403, 197) and (406, 27).
; PLAN: r0=403(x1), r1=197(y1), r2=406(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 197
LDI r2, 406
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
