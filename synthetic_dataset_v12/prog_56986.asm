; DESCRIPTION: Renders a cyan box of size 46x19 starting at (254, 118).
; PLAN: r0=254(x), r1=118(y), r2=46(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 118
LDI r2, 46
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
