; DESCRIPTION: Places a cyan 116x87 rectangle at position (54, 124).
; PLAN: r0=54(x), r1=124(y), r2=116(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 124
LDI r2, 116
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
