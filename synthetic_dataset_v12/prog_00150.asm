; DESCRIPTION: Places a red 46x43 rectangle at position (291, 42).
; PLAN: r0=291(x), r1=42(y), r2=46(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 42
LDI r2, 46
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
