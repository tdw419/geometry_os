; DESCRIPTION: Places a orange 73x64 rectangle at position (344, 64).
; PLAN: r0=344(x), r1=64(y), r2=73(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 64
LDI r2, 73
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
