; DESCRIPTION: Places a green 42x99 rectangle at position (371, 26).
; PLAN: r0=371(x), r1=26(y), r2=42(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 26
LDI r2, 42
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
