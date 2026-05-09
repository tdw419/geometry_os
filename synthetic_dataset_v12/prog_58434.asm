; DESCRIPTION: Draws a white line from (510, 226) to (435, 30).
; PLAN: r0=510(x1), r1=226(y1), r2=435(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 226
LDI r2, 435
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
