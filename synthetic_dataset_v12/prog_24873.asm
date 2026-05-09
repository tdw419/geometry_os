; DESCRIPTION: Places a magenta 82x82 rectangle at position (183, 157).
; PLAN: r0=183(x), r1=157(y), r2=82(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 157
LDI r2, 82
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
