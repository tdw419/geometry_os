; DESCRIPTION: Composite: . Then Draws a black line from (200, 89) to (204, 167). Then Renders a yellow box of size 18x38 starting at (210, 35).
; PLAN: r0=200(x1), r1=89(y1), r2=204(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=210(x), r1=35(y), r2=18(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (200, 89) to (204, 167).
; PLAN: r0=200(x1), r1=89(y1), r2=204(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 89
LDI r2, 204
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow box of size 18x38 starting at (210, 35).
; PLAN: r0=210(x), r1=35(y), r2=18(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 35
LDI r2, 18
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
