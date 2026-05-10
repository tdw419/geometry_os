; DESCRIPTION: Creates a cyan filled rectangle of size 86x41 starting at (203, 108).
; PLAN: r0=203(x), r1=108(y), r2=86(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 108
LDI r2, 86
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
