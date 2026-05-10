; DESCRIPTION: Draws a cyan rectangle at (57, 168) with width 66 and height 72.
; PLAN: r0=57(x), r1=168(y), r2=66(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 168
LDI r2, 66
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
