; DESCRIPTION: Draws a white line from (150, 49) to (98, 28).
; PLAN: r0=150(x1), r1=49(y1), r2=98(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 49
LDI r2, 98
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
