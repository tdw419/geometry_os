; DESCRIPTION: Draws a green line from (189, 19) to (299, 59).
; PLAN: r0=189(x1), r1=19(y1), r2=299(x2), r3=59(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 19
LDI r2, 299
LDI r3, 59
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
