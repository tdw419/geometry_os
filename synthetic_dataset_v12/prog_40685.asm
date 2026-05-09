; DESCRIPTION: Draws a green line from (397, 243) to (400, 156).
; PLAN: r0=397(x1), r1=243(y1), r2=400(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 243
LDI r2, 400
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
