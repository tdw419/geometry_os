; DESCRIPTION: Places a magenta 39x28 rectangle at position (111, 34).
; PLAN: r0=111(x), r1=34(y), r2=39(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 34
LDI r2, 39
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
