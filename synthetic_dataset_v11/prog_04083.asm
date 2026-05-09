; DESCRIPTION: Composite: . Then Draws a yellow line from (185, 139) to (76, 128). Then Renders a red box of size 104x22 starting at (0, 18).
; PLAN: r0=185(x1), r1=139(y1), r2=76(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=0(x), r1=18(y), r2=104(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow line from (185, 139) to (76, 128).
; PLAN: r0=185(x1), r1=139(y1), r2=76(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 139
LDI r2, 76
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red box of size 104x22 starting at (0, 18).
; PLAN: r0=0(x), r1=18(y), r2=104(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 18
LDI r2, 104
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
