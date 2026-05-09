; DESCRIPTION: Renders a cyan box of size 33x28 starting at (341, 43).
; PLAN: r0=341(x), r1=43(y), r2=33(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 43
LDI r2, 33
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
