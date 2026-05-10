; DESCRIPTION: Draws a cyan rectangle at (72, 28) with width 32 and height 86.
; PLAN: r0=72(x), r1=28(y), r2=32(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 28
LDI r2, 32
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
