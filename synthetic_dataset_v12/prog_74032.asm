; DESCRIPTION: Renders a blue line between points (267, 244) and (304, 27).
; PLAN: r0=267(x1), r1=244(y1), r2=304(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 244
LDI r2, 304
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
