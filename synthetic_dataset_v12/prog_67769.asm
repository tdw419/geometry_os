; DESCRIPTION: Renders a cyan box of size 78x97 starting at (341, 7).
; PLAN: r0=341(x), r1=7(y), r2=78(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 7
LDI r2, 78
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
