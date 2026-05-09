; DESCRIPTION: Draws a green line from (439, 67) to (342, 134).
; PLAN: r0=439(x1), r1=67(y1), r2=342(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 67
LDI r2, 342
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
