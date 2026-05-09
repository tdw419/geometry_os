; DESCRIPTION: Renders a cyan box of size 45x58 starting at (222, 128).
; PLAN: r0=222(x), r1=128(y), r2=45(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 128
LDI r2, 45
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
