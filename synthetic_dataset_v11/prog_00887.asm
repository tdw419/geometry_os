; DESCRIPTION: Places a cyan 56x116 rectangle at position (194, 116).
; PLAN: r0=194(x), r1=116(y), r2=56(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 116
LDI r2, 56
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
