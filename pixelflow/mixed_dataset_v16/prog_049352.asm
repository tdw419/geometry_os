; DESCRIPTION: Places a red 96x102 rectangle at position (167, 117).
; PLAN: r0=167(x), r1=117(y), r2=96(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 117
LDI r2, 96
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
