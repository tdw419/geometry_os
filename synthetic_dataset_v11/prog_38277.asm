; DESCRIPTION: Draws a cyan line from (93, 76) to (221, 244).
; PLAN: r0=93(x1), r1=76(y1), r2=221(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 76
LDI r2, 221
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
