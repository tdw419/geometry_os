; DESCRIPTION: Creates a cyan filled rectangle of size 68x59 starting at (228, 188).
; PLAN: r0=228(x), r1=188(y), r2=68(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 188
LDI r2, 68
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
