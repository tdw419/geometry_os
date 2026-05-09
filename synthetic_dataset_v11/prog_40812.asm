; DESCRIPTION: Places a green 105x32 rectangle at position (150, 87).
; PLAN: r0=150(x), r1=87(y), r2=105(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 87
LDI r2, 105
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
