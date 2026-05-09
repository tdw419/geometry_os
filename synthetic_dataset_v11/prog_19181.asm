; DESCRIPTION: Renders a cyan box of size 21x14 starting at (166, 217).
; PLAN: r0=166(x), r1=217(y), r2=21(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 217
LDI r2, 21
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
