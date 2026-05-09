; DESCRIPTION: Renders a orange line between points (231, 53) and (59, 236).
; PLAN: r0=231(x1), r1=53(y1), r2=59(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 53
LDI r2, 59
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
