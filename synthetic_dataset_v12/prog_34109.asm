; DESCRIPTION: Draws a cyan line from (6, 157) to (181, 154).
; PLAN: r0=6(x1), r1=157(y1), r2=181(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 157
LDI r2, 181
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
