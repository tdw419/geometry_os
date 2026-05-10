; DESCRIPTION: Renders a cyan box of size 67x46 starting at (376, 189).
; PLAN: r0=376(x), r1=189(y), r2=67(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 189
LDI r2, 67
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
