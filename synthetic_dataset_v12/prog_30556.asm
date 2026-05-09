; DESCRIPTION: Draws a yellow line from (398, 101) to (507, 166).
; PLAN: r0=398(x1), r1=101(y1), r2=507(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 101
LDI r2, 507
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
