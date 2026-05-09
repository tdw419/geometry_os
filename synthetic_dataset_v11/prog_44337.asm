; DESCRIPTION: Draws a cyan line from (4, 93) to (35, 163).
; PLAN: r0=4(x1), r1=93(y1), r2=35(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 93
LDI r2, 35
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
