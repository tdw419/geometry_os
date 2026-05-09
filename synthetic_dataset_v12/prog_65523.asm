; DESCRIPTION: Renders a green line between points (215, 249) and (39, 140).
; PLAN: r0=215(x1), r1=249(y1), r2=39(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 249
LDI r2, 39
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
