; DESCRIPTION: Draws a cyan rectangle at (92, 191) with width 96 and height 18.
; PLAN: r0=92(x), r1=191(y), r2=96(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 191
LDI r2, 96
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
