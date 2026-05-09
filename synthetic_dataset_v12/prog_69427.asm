; DESCRIPTION: Draws a cyan rectangle at (27, 130) with width 24 and height 32.
; PLAN: r0=27(x), r1=130(y), r2=24(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 130
LDI r2, 24
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
