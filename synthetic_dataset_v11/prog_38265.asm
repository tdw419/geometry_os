; DESCRIPTION: Renders a cyan line between points (164, 227) and (221, 152).
; PLAN: r0=164(x1), r1=227(y1), r2=221(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 227
LDI r2, 221
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
