; DESCRIPTION: Places a magenta 117x13 rectangle at position (32, 124).
; PLAN: r0=32(x), r1=124(y), r2=117(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 124
LDI r2, 117
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
