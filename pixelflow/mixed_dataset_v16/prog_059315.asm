; DESCRIPTION: Places a magenta 102x37 rectangle at position (384, 60).
; PLAN: r0=384(x), r1=60(y), r2=102(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 60
LDI r2, 102
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
