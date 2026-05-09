; DESCRIPTION: Draws a cyan line from (30, 179) to (377, 70).
; PLAN: r0=30(x1), r1=179(y1), r2=377(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 179
LDI r2, 377
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
