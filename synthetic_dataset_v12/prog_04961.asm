; DESCRIPTION: Draws a cyan line from (205, 253) to (85, 163).
; PLAN: r0=205(x1), r1=253(y1), r2=85(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 253
LDI r2, 85
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
