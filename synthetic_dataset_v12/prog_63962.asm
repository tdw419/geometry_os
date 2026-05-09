; DESCRIPTION: Renders a cyan line between points (436, 222) and (164, 168).
; PLAN: r0=436(x1), r1=222(y1), r2=164(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 222
LDI r2, 164
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
