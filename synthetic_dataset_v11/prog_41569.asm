; DESCRIPTION: Composite: . Then Renders a red box of size 62x120 starting at (187, 0). Then Draws a red circle centered at (90, 84) with radius 59.
; PLAN: r0=187(x), r1=0(y), r2=62(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=90(x), r1=84(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red box of size 62x120 starting at (187, 0).
; PLAN: r0=187(x), r1=0(y), r2=62(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 0
LDI r2, 62
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red circle centered at (90, 84) with radius 59.
; PLAN: r0=90(x), r1=84(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 84
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
