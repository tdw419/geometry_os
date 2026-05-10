; DESCRIPTION: Creates a red filled rectangle of size 120x56 starting at (346, 29).
; PLAN: r0=346(x), r1=29(y), r2=120(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 29
LDI r2, 120
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
