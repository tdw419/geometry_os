; DESCRIPTION: Places a red 13x113 rectangle at position (336, 128).
; PLAN: r0=336(x), r1=128(y), r2=13(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 128
LDI r2, 13
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
