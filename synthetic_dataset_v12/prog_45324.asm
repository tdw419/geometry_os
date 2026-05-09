; DESCRIPTION: Draws a cyan rectangle at (307, 60) with width 86 and height 107.
; PLAN: r0=307(x), r1=60(y), r2=86(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 60
LDI r2, 86
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
