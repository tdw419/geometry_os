; DESCRIPTION: Renders a cyan box of size 34x76 starting at (442, 22).
; PLAN: r0=442(x), r1=22(y), r2=34(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 22
LDI r2, 34
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
