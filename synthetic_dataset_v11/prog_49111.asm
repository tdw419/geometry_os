; DESCRIPTION: Draws a cyan line from (81, 76) to (157, 154).
; PLAN: r0=81(x1), r1=76(y1), r2=157(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 76
LDI r2, 157
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
