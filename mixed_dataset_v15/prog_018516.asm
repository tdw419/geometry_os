; DESCRIPTION: Draws a white line from (43, 126) to (175, 21).
; PLAN: r0=43(x1), r1=126(y1), r2=175(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 126
LDI r2, 175
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
