; DESCRIPTION: Places a blue 27x49 rectangle at position (299, 165).
; PLAN: r0=299(x), r1=165(y), r2=27(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 165
LDI r2, 27
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
