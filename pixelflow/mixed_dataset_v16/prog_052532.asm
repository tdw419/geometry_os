; DESCRIPTION: Draws a green line from (426, 27) to (425, 105).
; PLAN: r0=426(x1), r1=27(y1), r2=425(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 27
LDI r2, 425
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
