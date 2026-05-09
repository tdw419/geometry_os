; DESCRIPTION: Draws a white line from (303, 175) to (326, 29).
; PLAN: r0=303(x1), r1=175(y1), r2=326(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 175
LDI r2, 326
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
