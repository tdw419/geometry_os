; DESCRIPTION: Renders a cyan box of size 65x49 starting at (104, 163).
; PLAN: r0=104(x), r1=163(y), r2=65(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 163
LDI r2, 65
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
