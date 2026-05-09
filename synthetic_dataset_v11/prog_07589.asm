; DESCRIPTION: Draws a cyan line from (162, 238) to (5, 8).
; PLAN: r0=162(x1), r1=238(y1), r2=5(x2), r3=8(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 238
LDI r2, 5
LDI r3, 8
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
