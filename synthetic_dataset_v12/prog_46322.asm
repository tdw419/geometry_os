; DESCRIPTION: Draws a black line from (107, 238) to (384, 113).
; PLAN: r0=107(x1), r1=238(y1), r2=384(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 238
LDI r2, 384
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
