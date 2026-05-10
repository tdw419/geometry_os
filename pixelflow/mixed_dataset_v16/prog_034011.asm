; DESCRIPTION: Renders a cyan box of size 109x97 starting at (76, 99).
; PLAN: r0=76(x), r1=99(y), r2=109(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 99
LDI r2, 109
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
