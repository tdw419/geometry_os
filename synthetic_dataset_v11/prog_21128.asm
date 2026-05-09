; DESCRIPTION: Places a green 19x63 rectangle at position (100, 187).
; PLAN: r0=100(x), r1=187(y), r2=19(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 187
LDI r2, 19
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
