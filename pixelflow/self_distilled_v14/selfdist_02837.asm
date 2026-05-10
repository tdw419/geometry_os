; DESCRIPTION: Draws a red line from (371, 67) to (343, 186).
; PLAN: r0=371(x1), r1=67(y1), r2=343(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 67
LDI r2, 343
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
