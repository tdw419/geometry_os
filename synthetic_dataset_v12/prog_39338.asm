; DESCRIPTION: Draws a white line from (480, 215) to (282, 52).
; PLAN: r0=480(x1), r1=215(y1), r2=282(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 215
LDI r2, 282
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
