; DESCRIPTION: Draws a blue rectangle at (410, 111) with width 60 and height 24.
; PLAN: r0=410(x), r1=111(y), r2=60(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 111
LDI r2, 60
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
