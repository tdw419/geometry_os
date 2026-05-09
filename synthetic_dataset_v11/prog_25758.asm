; DESCRIPTION: Renders a green line between points (236, 215) and (31, 131).
; PLAN: r0=236(x1), r1=215(y1), r2=31(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 215
LDI r2, 31
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
