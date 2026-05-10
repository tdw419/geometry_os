; DESCRIPTION: Creates a cyan filled rectangle of size 71x15 starting at (369, 13).
; PLAN: r0=369(x), r1=13(y), r2=71(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 13
LDI r2, 71
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
