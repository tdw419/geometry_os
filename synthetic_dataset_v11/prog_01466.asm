; DESCRIPTION: Places a yellow line segment connecting (215, 66) to (213, 38).
; PLAN: r0=215(x1), r1=66(y1), r2=213(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 66
LDI r2, 213
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
