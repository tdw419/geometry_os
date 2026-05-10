; DESCRIPTION: Places a green 59x105 rectangle at position (336, 56).
; PLAN: r0=336(x), r1=56(y), r2=59(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 56
LDI r2, 59
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
