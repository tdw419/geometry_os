; DESCRIPTION: Renders a green line between points (372, 39) and (509, 225).
; PLAN: r0=372(x1), r1=39(y1), r2=509(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 39
LDI r2, 509
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
