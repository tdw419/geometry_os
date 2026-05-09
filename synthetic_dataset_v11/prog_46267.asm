; DESCRIPTION: Renders a cyan box of size 62x31 starting at (12, 23).
; PLAN: r0=12(x), r1=23(y), r2=62(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 23
LDI r2, 62
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
