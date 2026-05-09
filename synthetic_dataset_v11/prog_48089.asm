; DESCRIPTION: Draws a blue rectangle at (202, 18) with width 42 and height 111.
; PLAN: r0=202(x), r1=18(y), r2=42(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 18
LDI r2, 42
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
