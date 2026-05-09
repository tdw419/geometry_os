; DESCRIPTION: Draws a cyan line from (109, 76) to (14, 246).
; PLAN: r0=109(x1), r1=76(y1), r2=14(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 76
LDI r2, 14
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
