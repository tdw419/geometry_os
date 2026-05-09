; DESCRIPTION: Places a red 86x20 rectangle at position (121, 32).
; PLAN: r0=121(x), r1=32(y), r2=86(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 32
LDI r2, 86
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
