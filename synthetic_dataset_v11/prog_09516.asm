; DESCRIPTION: Draws a white line from (8, 36) to (215, 21).
; PLAN: r0=8(x1), r1=36(y1), r2=215(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 36
LDI r2, 215
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
