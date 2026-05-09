; DESCRIPTION: Draws a yellow line from (326, 213) to (399, 202).
; PLAN: r0=326(x1), r1=213(y1), r2=399(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 213
LDI r2, 399
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
