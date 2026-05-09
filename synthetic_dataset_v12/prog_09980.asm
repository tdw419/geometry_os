; DESCRIPTION: Renders a cyan box of size 45x83 starting at (167, 130).
; PLAN: r0=167(x), r1=130(y), r2=45(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 130
LDI r2, 45
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
