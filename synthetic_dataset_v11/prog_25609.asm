; DESCRIPTION: Renders a green line between points (255, 218) and (243, 215).
; PLAN: r0=255(x1), r1=218(y1), r2=243(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 218
LDI r2, 243
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
