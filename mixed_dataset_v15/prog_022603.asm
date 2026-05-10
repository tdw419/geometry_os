; DESCRIPTION: Renders a cyan box of size 100x24 starting at (388, 30).
; PLAN: r0=388(x), r1=30(y), r2=100(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 30
LDI r2, 100
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
