; DESCRIPTION: Places a green 43x38 rectangle at position (375, 160).
; PLAN: r0=375(x), r1=160(y), r2=43(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 160
LDI r2, 43
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
