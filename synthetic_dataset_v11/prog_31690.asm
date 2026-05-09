; DESCRIPTION: Places a cyan 108x10 rectangle at position (30, 224).
; PLAN: r0=30(x), r1=224(y), r2=108(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 224
LDI r2, 108
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
