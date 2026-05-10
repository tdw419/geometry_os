; DESCRIPTION: Places a green 63x103 rectangle at position (421, 65).
; PLAN: r0=421(x), r1=65(y), r2=63(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 65
LDI r2, 63
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
