; DESCRIPTION: Draws a cyan rectangle at (415, 165) with width 44 and height 90.
; PLAN: r0=415(x), r1=165(y), r2=44(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 165
LDI r2, 44
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
