; DESCRIPTION: Places a blue 66x96 rectangle at position (66, 27).
; PLAN: r0=66(x), r1=27(y), r2=66(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 27
LDI r2, 66
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
