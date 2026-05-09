; DESCRIPTION: Renders a green line between points (171, 176) and (198, 255).
; PLAN: r0=171(x1), r1=176(y1), r2=198(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 176
LDI r2, 198
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
