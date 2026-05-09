; DESCRIPTION: Places a magenta 73x76 rectangle at position (59, 130).
; PLAN: r0=59(x), r1=130(y), r2=73(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 130
LDI r2, 73
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
