; DESCRIPTION: Draws a yellow line from (215, 39) to (304, 172).
; PLAN: r0=215(x1), r1=39(y1), r2=304(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 39
LDI r2, 304
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
