; DESCRIPTION: Draws a green line from (59, 167) to (394, 149).
; PLAN: r0=59(x1), r1=167(y1), r2=394(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 167
LDI r2, 394
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
