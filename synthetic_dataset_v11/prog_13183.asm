; DESCRIPTION: Renders a cyan box of size 68x33 starting at (83, 88).
; PLAN: r0=83(x), r1=88(y), r2=68(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 88
LDI r2, 68
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
