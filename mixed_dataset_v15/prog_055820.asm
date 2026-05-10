; DESCRIPTION: Draws a white line from (374, 121) to (450, 61).
; PLAN: r0=374(x1), r1=121(y1), r2=450(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 121
LDI r2, 450
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
