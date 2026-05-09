; DESCRIPTION: Places a green 55x58 rectangle at position (42, 155).
; PLAN: r0=42(x), r1=155(y), r2=55(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 155
LDI r2, 55
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
