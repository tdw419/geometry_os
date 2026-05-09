; DESCRIPTION: Renders a black line between points (384, 249) and (164, 187).
; PLAN: r0=384(x1), r1=249(y1), r2=164(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 249
LDI r2, 164
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
