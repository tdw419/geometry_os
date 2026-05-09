; DESCRIPTION: Creates a cyan rectangular region at (167, 168) spanning 67 by 15 pixels.
; PLAN: r0=167(x), r1=168(y), r2=67(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 168
LDI r2, 67
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
