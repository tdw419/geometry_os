; DESCRIPTION: Places a cyan 88x47 rectangle at position (76, 142).
; PLAN: r0=76(x), r1=142(y), r2=88(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 142
LDI r2, 88
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
