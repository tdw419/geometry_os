; DESCRIPTION: Renders a cyan box of size 102x60 starting at (47, 2).
; PLAN: r0=47(x), r1=2(y), r2=102(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 2
LDI r2, 102
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
