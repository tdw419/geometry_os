; DESCRIPTION: Creates a red filled rectangle of size 51x59 starting at (176, 60).
; PLAN: r0=176(x), r1=60(y), r2=51(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 60
LDI r2, 51
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
