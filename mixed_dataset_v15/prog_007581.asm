; DESCRIPTION: Renders a cyan box of size 33x55 starting at (0, 122).
; PLAN: r0=0(x), r1=122(y), r2=33(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 122
LDI r2, 33
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
