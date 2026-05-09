; DESCRIPTION: Composite: . Then Draws a orange line from (218, 217) to (59, 153). Then Renders a red box of size 119x12 starting at (135, 187).
; PLAN: r0=218(x1), r1=217(y1), r2=59(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=135(x), r1=187(y), r2=119(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange line from (218, 217) to (59, 153).
; PLAN: r0=218(x1), r1=217(y1), r2=59(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 217
LDI r2, 59
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red box of size 119x12 starting at (135, 187).
; PLAN: r0=135(x), r1=187(y), r2=119(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 187
LDI r2, 119
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
