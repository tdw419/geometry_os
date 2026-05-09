; DESCRIPTION: Draws a cyan line from (195, 101) to (156, 69).
; PLAN: r0=195(x1), r1=101(y1), r2=156(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 101
LDI r2, 156
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
