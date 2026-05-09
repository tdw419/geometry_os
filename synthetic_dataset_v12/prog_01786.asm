; DESCRIPTION: Places a yellow line segment connecting (213, 121) to (126, 107).
; PLAN: r0=213(x1), r1=121(y1), r2=126(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 121
LDI r2, 126
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
