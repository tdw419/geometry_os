; DESCRIPTION: Places a red 102x42 rectangle at position (128, 210).
; PLAN: r0=128(x), r1=210(y), r2=102(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 210
LDI r2, 102
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
