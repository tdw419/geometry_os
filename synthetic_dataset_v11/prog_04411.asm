; DESCRIPTION: Renders a cyan box of size 62x69 starting at (29, 92).
; PLAN: r0=29(x), r1=92(y), r2=62(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 92
LDI r2, 62
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
