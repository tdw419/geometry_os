; DESCRIPTION: Places a cyan 100x103 rectangle at position (276, 2).
; PLAN: r0=276(x), r1=2(y), r2=100(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 2
LDI r2, 100
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
