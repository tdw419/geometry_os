; DESCRIPTION: Draws a green line from (157, 238) to (384, 57).
; PLAN: r0=157(x1), r1=238(y1), r2=384(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 238
LDI r2, 384
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
