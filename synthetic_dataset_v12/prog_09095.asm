; DESCRIPTION: Renders a cyan box of size 66x91 starting at (409, 97).
; PLAN: r0=409(x), r1=97(y), r2=66(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 97
LDI r2, 66
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
