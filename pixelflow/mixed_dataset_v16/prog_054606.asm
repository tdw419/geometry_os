; DESCRIPTION: Draws a cyan line from (8, 72) to (278, 123).
; PLAN: r0=8(x1), r1=72(y1), r2=278(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 72
LDI r2, 278
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
