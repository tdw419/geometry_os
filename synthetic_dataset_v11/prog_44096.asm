; DESCRIPTION: Places a cyan 40x52 rectangle at position (23, 62).
; PLAN: r0=23(x), r1=62(y), r2=40(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 62
LDI r2, 40
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
