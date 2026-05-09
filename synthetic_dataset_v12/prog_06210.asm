; DESCRIPTION: Draws a cyan line from (262, 162) to (366, 180).
; PLAN: r0=262(x1), r1=162(y1), r2=366(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 162
LDI r2, 366
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
