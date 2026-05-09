; DESCRIPTION: Places a yellow 42x99 rectangle at position (34, 63).
; PLAN: r0=34(x), r1=63(y), r2=42(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 63
LDI r2, 42
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
