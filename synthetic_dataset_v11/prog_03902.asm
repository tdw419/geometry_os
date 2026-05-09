; DESCRIPTION: Draws a cyan line from (180, 229) to (100, 0).
; PLAN: r0=180(x1), r1=229(y1), r2=100(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 229
LDI r2, 100
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
