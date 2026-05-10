; DESCRIPTION: Draws a green line from (426, 72) to (16, 168).
; PLAN: r0=426(x1), r1=72(y1), r2=16(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 72
LDI r2, 16
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
