; DESCRIPTION: Renders a cyan box of size 34x114 starting at (60, 96).
; PLAN: r0=60(x), r1=96(y), r2=34(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 96
LDI r2, 34
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
