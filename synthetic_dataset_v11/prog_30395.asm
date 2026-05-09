; DESCRIPTION: Renders a cyan box of size 20x114 starting at (171, 123).
; PLAN: r0=171(x), r1=123(y), r2=20(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 123
LDI r2, 20
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
