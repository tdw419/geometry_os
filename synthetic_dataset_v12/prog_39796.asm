; DESCRIPTION: Draws a green line from (255, 3) to (245, 168).
; PLAN: r0=255(x1), r1=3(y1), r2=245(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 3
LDI r2, 245
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
