; DESCRIPTION: Renders a cyan box of size 40x91 starting at (97, 138).
; PLAN: r0=97(x), r1=138(y), r2=40(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 138
LDI r2, 40
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
