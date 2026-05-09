; DESCRIPTION: Places a blue 96x36 rectangle at position (281, 189).
; PLAN: r0=281(x), r1=189(y), r2=96(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 189
LDI r2, 96
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
