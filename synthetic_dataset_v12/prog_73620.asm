; DESCRIPTION: Draws a cyan line from (206, 163) to (179, 15).
; PLAN: r0=206(x1), r1=163(y1), r2=179(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 163
LDI r2, 179
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
