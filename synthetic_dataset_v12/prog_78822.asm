; DESCRIPTION: Draws a white line from (374, 221) to (76, 179).
; PLAN: r0=374(x1), r1=221(y1), r2=76(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 221
LDI r2, 76
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
