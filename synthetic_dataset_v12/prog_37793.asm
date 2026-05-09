; DESCRIPTION: Places a magenta 39x16 rectangle at position (11, 14).
; PLAN: r0=11(x), r1=14(y), r2=39(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 14
LDI r2, 39
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
