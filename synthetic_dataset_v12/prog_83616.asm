; DESCRIPTION: Draws a cyan rectangle at (297, 146) with width 112 and height 32.
; PLAN: r0=297(x), r1=146(y), r2=112(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 146
LDI r2, 112
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
