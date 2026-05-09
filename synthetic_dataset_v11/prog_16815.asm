; DESCRIPTION: Draws a cyan line from (75, 149) to (78, 163).
; PLAN: r0=75(x1), r1=149(y1), r2=78(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 149
LDI r2, 78
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
