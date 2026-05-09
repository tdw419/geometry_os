; DESCRIPTION: Composite: . Then Draws a blue rectangle at (28, 55) with width 109 and height 29. Then Places a yellow dot at position (221, 42).
; PLAN: r0=28(x), r1=55(y), r2=109(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=221(x), r1=42(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue rectangle at (28, 55) with width 109 and height 29.
; PLAN: r0=28(x), r1=55(y), r2=109(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 55
LDI r2, 109
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (221, 42).
; PLAN: r0=221(x), r1=42(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 221
LDI r1, 42
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
