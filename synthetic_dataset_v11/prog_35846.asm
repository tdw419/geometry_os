; DESCRIPTION: Places a cyan 62x43 rectangle at position (184, 22).
; PLAN: r0=184(x), r1=22(y), r2=62(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 22
LDI r2, 62
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
