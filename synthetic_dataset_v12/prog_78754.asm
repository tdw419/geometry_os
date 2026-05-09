; DESCRIPTION: Places a green 42x91 rectangle at position (117, 105).
; PLAN: r0=117(x), r1=105(y), r2=42(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 105
LDI r2, 42
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
