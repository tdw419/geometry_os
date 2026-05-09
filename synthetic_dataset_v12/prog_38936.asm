; DESCRIPTION: Renders a cyan box of size 15x26 starting at (85, 144).
; PLAN: r0=85(x), r1=144(y), r2=15(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 144
LDI r2, 15
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
