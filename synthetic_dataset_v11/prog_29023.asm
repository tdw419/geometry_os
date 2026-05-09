; DESCRIPTION: Draws a cyan line from (247, 109) to (120, 105).
; PLAN: r0=247(x1), r1=109(y1), r2=120(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 109
LDI r2, 120
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
