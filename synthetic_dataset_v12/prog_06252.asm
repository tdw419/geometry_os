; DESCRIPTION: Renders a green line between points (392, 218) and (360, 236).
; PLAN: r0=392(x1), r1=218(y1), r2=360(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 218
LDI r2, 360
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
