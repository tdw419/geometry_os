; DESCRIPTION: Creates a red filled rectangle of size 27x20 starting at (362, 36).
; PLAN: r0=362(x), r1=36(y), r2=27(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 36
LDI r2, 27
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
