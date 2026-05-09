; DESCRIPTION: Draws a white line from (256, 129) to (35, 34).
; PLAN: r0=256(x1), r1=129(y1), r2=35(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 129
LDI r2, 35
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
