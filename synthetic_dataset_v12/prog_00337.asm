; DESCRIPTION: Renders a cyan box of size 49x44 starting at (12, 90).
; PLAN: r0=12(x), r1=90(y), r2=49(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 90
LDI r2, 49
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
