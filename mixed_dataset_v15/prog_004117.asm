; DESCRIPTION: Draws a cyan line from (12, 178) to (3, 72).
; PLAN: r0=12(x1), r1=178(y1), r2=3(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 178
LDI r2, 3
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
