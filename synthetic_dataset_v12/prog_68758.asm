; DESCRIPTION: Renders a cyan box of size 23x114 starting at (224, 118).
; PLAN: r0=224(x), r1=118(y), r2=23(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 118
LDI r2, 23
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
