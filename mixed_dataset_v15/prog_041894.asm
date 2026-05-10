; DESCRIPTION: Draws a orange rectangle at (415, 182) with width 82 and height 10.
; PLAN: r0=415(x), r1=182(y), r2=82(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 182
LDI r2, 82
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
