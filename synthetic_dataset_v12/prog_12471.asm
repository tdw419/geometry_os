; DESCRIPTION: Draws a white line from (285, 238) to (264, 146).
; PLAN: r0=285(x1), r1=238(y1), r2=264(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 238
LDI r2, 264
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
