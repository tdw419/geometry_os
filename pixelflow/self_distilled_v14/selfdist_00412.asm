; DESCRIPTION: Draws a cyan line from (60, 76) to (124, 189).
; PLAN: r0=60(x1), r1=76(y1), r2=124(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 76
LDI r2, 124
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
