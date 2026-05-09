; DESCRIPTION: Renders a green line between points (397, 131) and (28, 23).
; PLAN: r0=397(x1), r1=131(y1), r2=28(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 131
LDI r2, 28
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
