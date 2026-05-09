; DESCRIPTION: Composite: . Then Renders a black box of size 39x76 starting at (7, 175). Then Places a magenta circle of radius 42 at center (82, 138).
; PLAN: r0=7(x), r1=175(y), r2=39(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=82(x), r1=138(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black box of size 39x76 starting at (7, 175).
; PLAN: r0=7(x), r1=175(y), r2=39(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 175
LDI r2, 39
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 42 at center (82, 138).
; PLAN: r0=82(x), r1=138(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 138
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
