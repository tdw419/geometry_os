; DESCRIPTION: Renders a yellow line between points (195, 165) and (202, 215).
; PLAN: r0=195(x1), r1=165(y1), r2=202(x2), r3=215(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 165
LDI r2, 202
LDI r3, 215
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
