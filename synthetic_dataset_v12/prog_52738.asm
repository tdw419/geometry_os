; DESCRIPTION: Places a magenta 111x34 rectangle at position (93, 7).
; PLAN: r0=93(x), r1=7(y), r2=111(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 7
LDI r2, 111
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
