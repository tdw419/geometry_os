; DESCRIPTION: Composite: . Then Places a orange 71x28 rectangle at position (82, 226). Then Draws a yellow circle centered at (64, 115) with radius 60.
; PLAN: r0=82(x), r1=226(y), r2=71(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=64(x), r1=115(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange 71x28 rectangle at position (82, 226).
; PLAN: r0=82(x), r1=226(y), r2=71(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 226
LDI r2, 71
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (64, 115) with radius 60.
; PLAN: r0=64(x), r1=115(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 115
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
