; DESCRIPTION: Places a cyan 76x58 rectangle at position (348, 186).
; PLAN: r0=348(x), r1=186(y), r2=76(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 186
LDI r2, 76
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
