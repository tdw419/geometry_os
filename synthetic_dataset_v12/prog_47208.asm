; DESCRIPTION: Places a magenta 103x102 rectangle at position (299, 27).
; PLAN: r0=299(x), r1=27(y), r2=103(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 27
LDI r2, 103
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
