; DESCRIPTION: Draws a cyan line from (179, 163) to (90, 8).
; PLAN: r0=179(x1), r1=163(y1), r2=90(x2), r3=8(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 163
LDI r2, 90
LDI r3, 8
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
