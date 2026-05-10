; DESCRIPTION: Renders a cyan box of size 70x72 starting at (339, 100).
; PLAN: r0=339(x), r1=100(y), r2=70(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 100
LDI r2, 70
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
