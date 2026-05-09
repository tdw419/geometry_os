; DESCRIPTION: Draws a blue line from (156, 64) to (214, 187).
; PLAN: r0=156(x1), r1=64(y1), r2=214(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 64
LDI r2, 214
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
