; DESCRIPTION: Renders a cyan box of size 88x104 starting at (26, 59).
; PLAN: r0=26(x), r1=59(y), r2=88(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 59
LDI r2, 88
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
