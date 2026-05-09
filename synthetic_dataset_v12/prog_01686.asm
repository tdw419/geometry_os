; DESCRIPTION: Places a magenta 76x33 rectangle at position (175, 47).
; PLAN: r0=175(x), r1=47(y), r2=76(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 47
LDI r2, 76
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
