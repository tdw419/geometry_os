; DESCRIPTION: Composite: . Then Renders a red box of size 52x32 starting at (65, 103). Then Places a red circle of radius 46 at center (182, 188).
; PLAN: r0=65(x), r1=103(y), r2=52(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=182(x), r1=188(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red box of size 52x32 starting at (65, 103).
; PLAN: r0=65(x), r1=103(y), r2=52(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 103
LDI r2, 52
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 46 at center (182, 188).
; PLAN: r0=182(x), r1=188(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 188
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
