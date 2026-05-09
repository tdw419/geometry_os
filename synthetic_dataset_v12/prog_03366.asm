; DESCRIPTION: Draws a green line from (58, 183) to (380, 113).
; PLAN: r0=58(x1), r1=183(y1), r2=380(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 183
LDI r2, 380
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
