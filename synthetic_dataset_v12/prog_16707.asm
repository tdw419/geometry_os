; DESCRIPTION: Renders a cyan box of size 17x63 starting at (46, 138).
; PLAN: r0=46(x), r1=138(y), r2=17(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 138
LDI r2, 17
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
