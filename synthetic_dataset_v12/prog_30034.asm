; DESCRIPTION: Draws a magenta line from (507, 31) to (214, 12).
; PLAN: r0=507(x1), r1=31(y1), r2=214(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 31
LDI r2, 214
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
