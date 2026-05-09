; DESCRIPTION: Draws a magenta line from (437, 69) to (303, 55).
; PLAN: r0=437(x1), r1=69(y1), r2=303(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 69
LDI r2, 303
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
