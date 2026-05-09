; DESCRIPTION: Renders a cyan box of size 46x106 starting at (388, 23).
; PLAN: r0=388(x), r1=23(y), r2=46(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 23
LDI r2, 46
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
