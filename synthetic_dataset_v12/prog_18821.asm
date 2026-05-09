; DESCRIPTION: Places a green 28x62 rectangle at position (331, 28).
; PLAN: r0=331(x), r1=28(y), r2=28(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 28
LDI r2, 28
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
