; DESCRIPTION: Creates a red filled rectangle of size 74x63 starting at (284, 156).
; PLAN: r0=284(x), r1=156(y), r2=74(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 156
LDI r2, 74
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
