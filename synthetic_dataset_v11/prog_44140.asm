; DESCRIPTION: Draws a magenta line from (239, 78) to (214, 199).
; PLAN: r0=239(x1), r1=78(y1), r2=214(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 78
LDI r2, 214
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
