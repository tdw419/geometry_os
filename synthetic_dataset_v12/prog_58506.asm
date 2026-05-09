; DESCRIPTION: Places a cyan 20x88 rectangle at position (16, 12).
; PLAN: r0=16(x), r1=12(y), r2=20(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 12
LDI r2, 20
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
