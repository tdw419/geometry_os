; DESCRIPTION: Draws a cyan rectangle at (434, 182) with width 53 and height 15.
; PLAN: r0=434(x), r1=182(y), r2=53(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 182
LDI r2, 53
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
