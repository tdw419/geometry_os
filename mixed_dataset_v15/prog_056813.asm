; DESCRIPTION: Places a green 63x115 rectangle at position (66, 56).
; PLAN: r0=66(x), r1=56(y), r2=63(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 56
LDI r2, 63
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
