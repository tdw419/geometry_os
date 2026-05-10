; DESCRIPTION: Places a green 42x97 rectangle at position (190, 23).
; PLAN: r0=190(x), r1=23(y), r2=42(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 23
LDI r2, 42
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
