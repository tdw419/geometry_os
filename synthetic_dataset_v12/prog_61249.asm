; DESCRIPTION: Renders a cyan box of size 45x83 starting at (232, 168).
; PLAN: r0=232(x), r1=168(y), r2=45(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 168
LDI r2, 45
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
