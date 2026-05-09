; DESCRIPTION: Draws a white line from (395, 221) to (280, 160).
; PLAN: r0=395(x1), r1=221(y1), r2=280(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 221
LDI r2, 280
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
