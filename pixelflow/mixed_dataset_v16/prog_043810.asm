; DESCRIPTION: Creates a cyan filled rectangle of size 71x33 starting at (59, 1).
; PLAN: r0=59(x), r1=1(y), r2=71(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 1
LDI r2, 71
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
