; DESCRIPTION: Places a black 42x47 rectangle at position (261, 28).
; PLAN: r0=261(x), r1=28(y), r2=42(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 28
LDI r2, 42
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
