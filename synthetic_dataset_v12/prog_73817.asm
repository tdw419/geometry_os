; DESCRIPTION: Renders a cyan box of size 108x16 starting at (139, 181).
; PLAN: r0=139(x), r1=181(y), r2=108(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 181
LDI r2, 108
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
