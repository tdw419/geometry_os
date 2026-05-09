; DESCRIPTION: Places a red 27x60 rectangle at position (74, 69).
; PLAN: r0=74(x), r1=69(y), r2=27(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 69
LDI r2, 27
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
