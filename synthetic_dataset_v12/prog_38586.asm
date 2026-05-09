; DESCRIPTION: Places a blue 86x66 rectangle at position (184, 27).
; PLAN: r0=184(x), r1=27(y), r2=86(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 27
LDI r2, 86
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
