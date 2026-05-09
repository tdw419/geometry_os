; DESCRIPTION: Renders a cyan line between points (353, 213) and (476, 84).
; PLAN: r0=353(x1), r1=213(y1), r2=476(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 213
LDI r2, 476
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
