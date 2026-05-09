; DESCRIPTION: Places a red 19x20 rectangle at position (213, 70).
; PLAN: r0=213(x), r1=70(y), r2=19(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 70
LDI r2, 19
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
