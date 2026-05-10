; DESCRIPTION: Draws a white line from (90, 134) to (16, 38).
; PLAN: r0=90(x1), r1=134(y1), r2=16(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 134
LDI r2, 16
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
