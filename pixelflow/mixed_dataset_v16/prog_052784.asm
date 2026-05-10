; DESCRIPTION: Renders a cyan box of size 23x40 starting at (104, 181).
; PLAN: r0=104(x), r1=181(y), r2=23(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 181
LDI r2, 23
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
