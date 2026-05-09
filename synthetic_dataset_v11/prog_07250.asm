; DESCRIPTION: Renders a cyan box of size 117x20 starting at (14, 109).
; PLAN: r0=14(x), r1=109(y), r2=117(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 109
LDI r2, 117
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
