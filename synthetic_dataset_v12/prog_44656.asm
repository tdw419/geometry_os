; DESCRIPTION: Places a red 49x27 rectangle at position (389, 178).
; PLAN: r0=389(x), r1=178(y), r2=49(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 178
LDI r2, 49
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
