; DESCRIPTION: Places a red 62x21 rectangle at position (74, 52).
; PLAN: r0=74(x), r1=52(y), r2=62(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 52
LDI r2, 62
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
