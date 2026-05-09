; DESCRIPTION: Places a magenta 111x53 rectangle at position (125, 157).
; PLAN: r0=125(x), r1=157(y), r2=111(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 157
LDI r2, 111
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
