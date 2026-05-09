; DESCRIPTION: Renders a cyan box of size 11x19 starting at (33, 141).
; PLAN: r0=33(x), r1=141(y), r2=11(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 141
LDI r2, 11
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
