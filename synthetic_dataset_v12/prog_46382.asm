; DESCRIPTION: Draws a cyan line from (108, 197) to (93, 76).
; PLAN: r0=108(x1), r1=197(y1), r2=93(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 197
LDI r2, 93
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
