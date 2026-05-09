; DESCRIPTION: Draws a cyan line from (161, 12) to (26, 197).
; PLAN: r0=161(x1), r1=12(y1), r2=26(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 12
LDI r2, 26
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
