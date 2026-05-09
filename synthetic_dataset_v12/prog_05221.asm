; DESCRIPTION: Places a cyan 74x103 rectangle at position (361, 72).
; PLAN: r0=361(x), r1=72(y), r2=74(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 72
LDI r2, 74
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
