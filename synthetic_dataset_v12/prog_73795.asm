; DESCRIPTION: Renders a cyan box of size 43x49 starting at (45, 30).
; PLAN: r0=45(x), r1=30(y), r2=43(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 30
LDI r2, 43
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
