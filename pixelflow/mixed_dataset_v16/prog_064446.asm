; DESCRIPTION: Draws a cyan rectangle at (242, 81) with width 27 and height 67.
; PLAN: r0=242(x), r1=81(y), r2=27(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 81
LDI r2, 27
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
