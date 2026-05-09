; DESCRIPTION: Renders a cyan box of size 45x114 starting at (447, 135).
; PLAN: r0=447(x), r1=135(y), r2=45(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 135
LDI r2, 45
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
