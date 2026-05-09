; DESCRIPTION: Places a cyan 77x68 rectangle at position (239, 31).
; PLAN: r0=239(x), r1=31(y), r2=77(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 31
LDI r2, 77
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
