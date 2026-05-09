; DESCRIPTION: Places a red 42x14 rectangle at position (20, 170).
; PLAN: r0=20(x), r1=170(y), r2=42(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 170
LDI r2, 42
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
