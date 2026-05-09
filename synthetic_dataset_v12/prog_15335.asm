; DESCRIPTION: Renders a white line between points (333, 157) and (66, 61).
; PLAN: r0=333(x1), r1=157(y1), r2=66(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 157
LDI r2, 66
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
