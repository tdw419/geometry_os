; DESCRIPTION: Places a cyan 116x16 rectangle at position (204, 56).
; PLAN: r0=204(x), r1=56(y), r2=116(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 56
LDI r2, 116
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
