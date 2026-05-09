; DESCRIPTION: Renders a cyan line between points (108, 122) and (231, 140).
; PLAN: r0=108(x1), r1=122(y1), r2=231(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 122
LDI r2, 231
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
