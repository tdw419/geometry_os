; DESCRIPTION: Renders a cyan box of size 20x43 starting at (389, 49).
; PLAN: r0=389(x), r1=49(y), r2=20(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 49
LDI r2, 20
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
