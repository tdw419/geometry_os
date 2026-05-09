; DESCRIPTION: Places a red 70x27 rectangle at position (49, 226).
; PLAN: r0=49(x), r1=226(y), r2=70(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 226
LDI r2, 70
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
