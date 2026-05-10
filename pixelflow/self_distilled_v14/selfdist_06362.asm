; DESCRIPTION: Draws a cyan line from (76, 100) to (220, 23).
; PLAN: r0=76(x1), r1=100(y1), r2=220(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 100
LDI r2, 220
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
