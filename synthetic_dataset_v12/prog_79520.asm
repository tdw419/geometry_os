; DESCRIPTION: Draws a cyan rectangle at (0, 19) with width 42 and height 27.
; PLAN: r0=0(x), r1=19(y), r2=42(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 19
LDI r2, 42
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
