; DESCRIPTION: Draws a magenta line from (49, 153) to (239, 187).
; PLAN: r0=49(x1), r1=153(y1), r2=239(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 153
LDI r2, 239
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
