; DESCRIPTION: Renders a cyan box of size 66x78 starting at (393, 24).
; PLAN: r0=393(x), r1=24(y), r2=66(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 24
LDI r2, 66
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
