; DESCRIPTION: Draws a white line from (262, 45) to (150, 249).
; PLAN: r0=262(x1), r1=45(y1), r2=150(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 45
LDI r2, 150
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
