; DESCRIPTION: Draws a green line from (507, 240) to (168, 239).
; PLAN: r0=507(x1), r1=240(y1), r2=168(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 240
LDI r2, 168
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
