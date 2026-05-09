; DESCRIPTION: Draws a red line from (255, 62) to (487, 197).
; PLAN: r0=255(x1), r1=62(y1), r2=487(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 62
LDI r2, 487
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
