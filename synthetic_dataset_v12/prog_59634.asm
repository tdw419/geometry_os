; DESCRIPTION: Renders a cyan box of size 74x85 starting at (78, 70).
; PLAN: r0=78(x), r1=70(y), r2=74(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 70
LDI r2, 74
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
