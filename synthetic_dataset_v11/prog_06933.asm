; DESCRIPTION: Composite: . Then Renders a yellow disk with center (183, 59) and radius 57. Then Renders a yellow box of size 21x41 starting at (146, 18).
; PLAN: r0=183(x), r1=59(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=146(x), r1=18(y), r2=21(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow disk with center (183, 59) and radius 57.
; PLAN: r0=183(x), r1=59(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 59
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow box of size 21x41 starting at (146, 18).
; PLAN: r0=146(x), r1=18(y), r2=21(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 18
LDI r2, 21
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
