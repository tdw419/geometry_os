; DESCRIPTION: Renders a cyan box of size 45x78 starting at (45, 117).
; PLAN: r0=45(x), r1=117(y), r2=45(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 117
LDI r2, 45
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
