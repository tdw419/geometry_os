; DESCRIPTION: Draws a cyan rectangle at (303, 228) with width 25 and height 24.
; PLAN: r0=303(x), r1=228(y), r2=25(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 228
LDI r2, 25
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
