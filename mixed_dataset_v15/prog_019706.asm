; DESCRIPTION: Creates a cyan filled rectangle of size 103x56 starting at (102, 25).
; PLAN: r0=102(x), r1=25(y), r2=103(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 25
LDI r2, 103
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
