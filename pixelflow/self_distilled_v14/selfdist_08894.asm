; DESCRIPTION: Draws a cyan line from (103, 108) to (301, 81).
; PLAN: r0=103(x1), r1=108(y1), r2=301(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 108
LDI r2, 301
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
