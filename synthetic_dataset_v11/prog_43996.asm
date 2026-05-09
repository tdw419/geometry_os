; DESCRIPTION: Places a red 117x40 rectangle at position (12, 64).
; PLAN: r0=12(x), r1=64(y), r2=117(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 64
LDI r2, 117
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
