; DESCRIPTION: Places a magenta 103x86 rectangle at position (299, 76).
; PLAN: r0=299(x), r1=76(y), r2=103(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 76
LDI r2, 103
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
