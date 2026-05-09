; DESCRIPTION: Renders a cyan box of size 35x96 starting at (101, 35).
; PLAN: r0=101(x), r1=35(y), r2=35(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 35
LDI r2, 35
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
