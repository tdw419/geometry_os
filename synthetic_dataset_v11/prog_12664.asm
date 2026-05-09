; DESCRIPTION: Renders a cyan box of size 76x22 starting at (101, 134).
; PLAN: r0=101(x), r1=134(y), r2=76(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 134
LDI r2, 76
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
