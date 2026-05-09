; DESCRIPTION: Draws a blue line from (305, 53) to (268, 178).
; PLAN: r0=305(x1), r1=53(y1), r2=268(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 53
LDI r2, 268
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
