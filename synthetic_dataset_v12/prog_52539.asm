; DESCRIPTION: Draws a yellow line from (240, 205) to (304, 214).
; PLAN: r0=240(x1), r1=205(y1), r2=304(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 205
LDI r2, 304
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
