; DESCRIPTION: Renders a cyan line between points (163, 215) and (501, 152).
; PLAN: r0=163(x1), r1=215(y1), r2=501(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 215
LDI r2, 501
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
