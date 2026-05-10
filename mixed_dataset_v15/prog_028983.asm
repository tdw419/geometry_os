; DESCRIPTION: Places a cyan 66x116 rectangle at position (123, 72).
; PLAN: r0=123(x), r1=72(y), r2=66(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 72
LDI r2, 66
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
