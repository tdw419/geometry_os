; DESCRIPTION: Renders a cyan box of size 69x98 starting at (14, 67).
; PLAN: r0=14(x), r1=67(y), r2=69(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 67
LDI r2, 69
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
