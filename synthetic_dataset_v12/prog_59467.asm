; DESCRIPTION: Draws a cyan rectangle at (447, 103) with width 18 and height 111.
; PLAN: r0=447(x), r1=103(y), r2=18(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 103
LDI r2, 18
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
