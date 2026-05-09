; DESCRIPTION: Composite: . Then Renders a red box of size 10x46 starting at (33, 173). Then Places a yellow line segment connecting (178, 233) to (236, 36).
; PLAN: r0=33(x), r1=173(y), r2=10(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=178(x1), r1=233(y1), r2=236(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red box of size 10x46 starting at (33, 173).
; PLAN: r0=33(x), r1=173(y), r2=10(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 173
LDI r2, 10
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow line segment connecting (178, 233) to (236, 36).
; PLAN: r0=178(x1), r1=233(y1), r2=236(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 233
LDI r2, 236
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
