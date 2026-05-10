; DESCRIPTION: Places a green 42x55 rectangle at position (427, 163).
; PLAN: r0=427(x), r1=163(y), r2=42(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 163
LDI r2, 42
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
