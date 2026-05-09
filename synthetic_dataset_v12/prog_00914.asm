; DESCRIPTION: Draws a white line from (54, 239) to (456, 15).
; PLAN: r0=54(x1), r1=239(y1), r2=456(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 239
LDI r2, 456
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
