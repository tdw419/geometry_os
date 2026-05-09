; DESCRIPTION: Places a magenta 33x27 rectangle at position (139, 98).
; PLAN: r0=139(x), r1=98(y), r2=33(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 98
LDI r2, 33
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
