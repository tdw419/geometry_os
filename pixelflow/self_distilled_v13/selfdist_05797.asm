; DESCRIPTION: Creates a red filled rectangle of size 24x73 starting at (215, 148).
; PLAN: r0=215(x), r1=148(y), r2=24(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 148
LDI r2, 24
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
