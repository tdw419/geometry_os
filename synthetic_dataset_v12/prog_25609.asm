; DESCRIPTION: Renders a blue line between points (480, 245) and (215, 188).
; PLAN: r0=480(x1), r1=245(y1), r2=215(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 245
LDI r2, 215
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
