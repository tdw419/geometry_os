; DESCRIPTION: Renders a cyan box of size 40x76 starting at (139, 23).
; PLAN: r0=139(x), r1=23(y), r2=40(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 23
LDI r2, 40
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
