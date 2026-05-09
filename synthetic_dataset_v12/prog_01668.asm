; DESCRIPTION: Renders a cyan box of size 88x21 starting at (380, 222).
; PLAN: r0=380(x), r1=222(y), r2=88(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 222
LDI r2, 88
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
