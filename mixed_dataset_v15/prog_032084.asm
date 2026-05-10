; DESCRIPTION: Creates a red filled rectangle of size 16x82 starting at (168, 144).
; PLAN: r0=168(x), r1=144(y), r2=16(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 144
LDI r2, 16
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
