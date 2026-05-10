; DESCRIPTION: Draws a green line from (231, 73) to (45, 93).
; PLAN: r0=231(x1), r1=73(y1), r2=45(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 73
LDI r2, 45
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
