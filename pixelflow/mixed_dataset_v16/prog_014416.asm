; DESCRIPTION: Places a green 14x43 rectangle at position (123, 58).
; PLAN: r0=123(x), r1=58(y), r2=14(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 58
LDI r2, 14
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
