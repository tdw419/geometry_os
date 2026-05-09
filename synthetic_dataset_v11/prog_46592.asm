; DESCRIPTION: Draws a white line from (146, 125) to (215, 104).
; PLAN: r0=146(x1), r1=125(y1), r2=215(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 125
LDI r2, 215
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
