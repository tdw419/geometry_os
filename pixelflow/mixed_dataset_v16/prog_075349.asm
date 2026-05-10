; DESCRIPTION: Creates a cyan filled rectangle of size 108x11 starting at (354, 44).
; PLAN: r0=354(x), r1=44(y), r2=108(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 44
LDI r2, 108
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
