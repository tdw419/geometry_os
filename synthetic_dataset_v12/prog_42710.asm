; DESCRIPTION: Draws a red line from (345, 236) to (149, 242).
; PLAN: r0=345(x1), r1=236(y1), r2=149(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 236
LDI r2, 149
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
