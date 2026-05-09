; DESCRIPTION: Places a yellow 10x13 rectangle at position (268, 16).
; PLAN: r0=268(x), r1=16(y), r2=10(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 16
LDI r2, 10
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
