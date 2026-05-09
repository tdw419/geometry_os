; DESCRIPTION: Places a cyan 72x95 rectangle at position (179, 58).
; PLAN: r0=179(x), r1=58(y), r2=72(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 58
LDI r2, 72
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
