; DESCRIPTION: Draws a cyan line from (10, 72) to (24, 1).
; PLAN: r0=10(x1), r1=72(y1), r2=24(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 72
LDI r2, 24
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
