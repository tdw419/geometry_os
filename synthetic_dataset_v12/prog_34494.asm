; DESCRIPTION: Renders a cyan box of size 58x24 starting at (137, 109).
; PLAN: r0=137(x), r1=109(y), r2=58(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 109
LDI r2, 58
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
