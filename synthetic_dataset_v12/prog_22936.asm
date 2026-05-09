; DESCRIPTION: Draws a green line from (460, 171) to (205, 182).
; PLAN: r0=460(x1), r1=171(y1), r2=205(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 171
LDI r2, 205
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
