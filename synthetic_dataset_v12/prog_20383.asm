; DESCRIPTION: Draws a white line from (30, 165) to (410, 2).
; PLAN: r0=30(x1), r1=165(y1), r2=410(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 165
LDI r2, 410
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
