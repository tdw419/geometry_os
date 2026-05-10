; DESCRIPTION: Renders a white rectangular region spanning 113 by 25 at (16, 46).
; PLAN: r0=16(x), r1=46(y), r2=113(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 46
LDI r2, 113
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
