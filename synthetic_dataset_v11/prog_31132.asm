; DESCRIPTION: Renders a cyan box of size 16x101 starting at (40, 94).
; PLAN: r0=40(x), r1=94(y), r2=16(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 94
LDI r2, 16
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
