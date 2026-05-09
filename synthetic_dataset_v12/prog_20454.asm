; DESCRIPTION: Renders a white line between points (197, 143) and (128, 66).
; PLAN: r0=197(x1), r1=143(y1), r2=128(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 143
LDI r2, 128
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
