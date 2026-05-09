; DESCRIPTION: Draws a cyan line from (149, 170) to (198, 166).
; PLAN: r0=149(x1), r1=170(y1), r2=198(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 170
LDI r2, 198
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
