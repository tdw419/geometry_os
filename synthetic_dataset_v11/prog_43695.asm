; DESCRIPTION: Draws a white line from (35, 94) to (20, 213).
; PLAN: r0=35(x1), r1=94(y1), r2=20(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 94
LDI r2, 20
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
