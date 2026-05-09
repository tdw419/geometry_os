; DESCRIPTION: Renders a green line between points (304, 226) and (263, 1).
; PLAN: r0=304(x1), r1=226(y1), r2=263(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 226
LDI r2, 263
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
