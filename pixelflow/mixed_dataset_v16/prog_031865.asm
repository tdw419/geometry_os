; DESCRIPTION: Draws a white line from (19, 60) to (215, 193).
; PLAN: r0=19(x1), r1=60(y1), r2=215(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 60
LDI r2, 215
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
