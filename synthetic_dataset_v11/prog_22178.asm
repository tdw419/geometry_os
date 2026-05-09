; DESCRIPTION: Draws a cyan line from (117, 109) to (84, 52).
; PLAN: r0=117(x1), r1=109(y1), r2=84(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 109
LDI r2, 84
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
