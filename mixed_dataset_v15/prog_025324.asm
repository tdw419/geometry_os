; DESCRIPTION: Places a green 19x28 rectangle at position (320, 148).
; PLAN: r0=320(x), r1=148(y), r2=19(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 148
LDI r2, 19
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
