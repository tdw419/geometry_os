; DESCRIPTION: Draws a white line from (0, 73) to (244, 86).
; PLAN: r0=0(x1), r1=73(y1), r2=244(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 73
LDI r2, 244
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
