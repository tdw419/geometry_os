; DESCRIPTION: Renders a cyan box of size 12x18 starting at (144, 153).
; PLAN: r0=144(x), r1=153(y), r2=12(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 153
LDI r2, 12
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
