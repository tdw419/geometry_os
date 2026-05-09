; DESCRIPTION: Draws a cyan line from (60, 100) to (135, 248).
; PLAN: r0=60(x1), r1=100(y1), r2=135(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 100
LDI r2, 135
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
