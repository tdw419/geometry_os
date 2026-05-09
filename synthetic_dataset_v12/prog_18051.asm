; DESCRIPTION: Renders a white line between points (2, 143) and (307, 220).
; PLAN: r0=2(x1), r1=143(y1), r2=307(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 143
LDI r2, 307
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
