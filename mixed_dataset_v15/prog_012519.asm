; DESCRIPTION: Places a green 99x63 rectangle at position (42, 26).
; PLAN: r0=42(x), r1=26(y), r2=99(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 26
LDI r2, 99
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
