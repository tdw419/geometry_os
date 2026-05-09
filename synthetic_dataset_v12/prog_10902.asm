; DESCRIPTION: Renders a cyan box of size 106x107 starting at (56, 44).
; PLAN: r0=56(x), r1=44(y), r2=106(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 44
LDI r2, 106
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
