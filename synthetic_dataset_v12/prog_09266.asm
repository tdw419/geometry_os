; DESCRIPTION: Draws a cyan rectangle at (228, 153) with width 12 and height 71.
; PLAN: r0=228(x), r1=153(y), r2=12(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 153
LDI r2, 12
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
