; DESCRIPTION: Draws a white line from (238, 123) to (502, 166).
; PLAN: r0=238(x1), r1=123(y1), r2=502(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 123
LDI r2, 502
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
