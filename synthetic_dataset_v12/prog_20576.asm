; DESCRIPTION: Draws a cyan line from (149, 98) to (313, 176).
; PLAN: r0=149(x1), r1=98(y1), r2=313(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 98
LDI r2, 313
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
