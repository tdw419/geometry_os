; DESCRIPTION: Draws a red rectangle at (307, 66) with width 42 and height 89.
; PLAN: r0=307(x), r1=66(y), r2=42(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 66
LDI r2, 42
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
