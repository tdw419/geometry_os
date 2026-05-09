; DESCRIPTION: Renders a cyan box of size 119x31 starting at (69, 102).
; PLAN: r0=69(x), r1=102(y), r2=119(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 102
LDI r2, 119
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
