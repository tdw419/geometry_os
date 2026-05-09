; DESCRIPTION: Renders a cyan box of size 78x70 starting at (121, 3).
; PLAN: r0=121(x), r1=3(y), r2=78(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 3
LDI r2, 78
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
