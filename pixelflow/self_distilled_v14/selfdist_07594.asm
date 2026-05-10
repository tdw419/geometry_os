; DESCRIPTION: Renders a red rectangular region spanning 25 by 46 at (371, 39).
; PLAN: r0=371(x), r1=39(y), r2=25(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 39
LDI r2, 25
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
