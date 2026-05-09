; DESCRIPTION: Composite: . Then Renders a yellow disk with center (51, 82) and radius 21. Then Creates a red rectangular region at (72, 35) spanning 59 by 39 pixels.
; PLAN: r0=51(x), r1=82(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=72(x), r1=35(y), r2=59(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow disk with center (51, 82) and radius 21.
; PLAN: r0=51(x), r1=82(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 82
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a red rectangular region at (72, 35) spanning 59 by 39 pixels.
; PLAN: r0=72(x), r1=35(y), r2=59(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 35
LDI r2, 59
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
