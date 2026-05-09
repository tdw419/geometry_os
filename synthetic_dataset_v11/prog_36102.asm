; DESCRIPTION: Draws a white line from (4, 120) to (127, 167).
; PLAN: r0=4(x1), r1=120(y1), r2=127(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 120
LDI r2, 127
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
