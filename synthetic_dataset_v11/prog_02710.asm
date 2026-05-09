; DESCRIPTION: Renders a cyan box of size 78x86 starting at (9, 40).
; PLAN: r0=9(x), r1=40(y), r2=78(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 40
LDI r2, 78
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
