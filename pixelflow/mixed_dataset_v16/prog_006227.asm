; DESCRIPTION: Creates a red filled rectangle of size 68x28 starting at (305, 163).
; PLAN: r0=305(x), r1=163(y), r2=68(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 163
LDI r2, 68
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
