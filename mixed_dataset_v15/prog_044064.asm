; DESCRIPTION: Draws a cyan rectangle at (42, 111) with width 66 and height 27.
; PLAN: r0=42(x), r1=111(y), r2=66(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 111
LDI r2, 66
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
