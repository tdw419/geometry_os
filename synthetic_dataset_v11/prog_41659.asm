; DESCRIPTION: Composite: . Then Renders a white box of size 27x82 starting at (135, 127). Then Places a yellow circle of radius 61 at center (72, 182).
; PLAN: r0=135(x), r1=127(y), r2=27(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=72(x), r1=182(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white box of size 27x82 starting at (135, 127).
; PLAN: r0=135(x), r1=127(y), r2=27(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 127
LDI r2, 27
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 61 at center (72, 182).
; PLAN: r0=72(x), r1=182(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 182
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
