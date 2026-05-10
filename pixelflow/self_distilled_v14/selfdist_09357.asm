; DESCRIPTION: Creates a cyan filled rectangle of size 29x90 starting at (53, 173).
; PLAN: r0=53(x), r1=173(y), r2=29(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 173
LDI r2, 29
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
