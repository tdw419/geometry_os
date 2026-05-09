; DESCRIPTION: Renders a cyan box of size 109x112 starting at (324, 138).
; PLAN: r0=324(x), r1=138(y), r2=109(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 138
LDI r2, 109
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
