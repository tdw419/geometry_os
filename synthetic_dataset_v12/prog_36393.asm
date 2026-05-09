; DESCRIPTION: Renders a cyan box of size 97x86 starting at (136, 165).
; PLAN: r0=136(x), r1=165(y), r2=97(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 165
LDI r2, 97
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
