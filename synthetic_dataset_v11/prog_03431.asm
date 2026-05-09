; DESCRIPTION: Draws a red line from (67, 215) to (9, 48).
; PLAN: r0=67(x1), r1=215(y1), r2=9(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 215
LDI r2, 9
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
