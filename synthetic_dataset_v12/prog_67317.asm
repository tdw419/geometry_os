; DESCRIPTION: Renders a cyan box of size 44x76 starting at (127, 138).
; PLAN: r0=127(x), r1=138(y), r2=44(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 138
LDI r2, 44
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
