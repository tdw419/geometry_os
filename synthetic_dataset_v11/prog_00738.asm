; DESCRIPTION: Places a cyan 62x77 rectangle at position (14, 13).
; PLAN: r0=14(x), r1=13(y), r2=62(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 13
LDI r2, 62
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
