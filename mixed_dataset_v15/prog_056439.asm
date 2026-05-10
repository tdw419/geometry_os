; DESCRIPTION: Draws a cyan rectangle at (465, 178) with width 42 and height 65.
; PLAN: r0=465(x), r1=178(y), r2=42(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 178
LDI r2, 42
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
