; DESCRIPTION: Renders a cyan box of size 12x76 starting at (12, 78).
; PLAN: r0=12(x), r1=78(y), r2=12(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 78
LDI r2, 12
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
