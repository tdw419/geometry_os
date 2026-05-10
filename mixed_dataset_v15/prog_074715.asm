; DESCRIPTION: Creates a cyan filled rectangle of size 97x67 starting at (367, 171).
; PLAN: r0=367(x), r1=171(y), r2=97(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 171
LDI r2, 97
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
