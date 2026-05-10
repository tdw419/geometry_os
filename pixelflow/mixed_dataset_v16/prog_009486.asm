; DESCRIPTION: Places a magenta 117x108 rectangle at position (297, 27).
; PLAN: r0=297(x), r1=27(y), r2=117(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 27
LDI r2, 117
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
