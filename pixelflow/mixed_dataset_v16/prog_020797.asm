; DESCRIPTION: Draws a white rectangle at (445, 47) with width 49 and height 111.
; PLAN: r0=445(x), r1=47(y), r2=49(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 47
LDI r2, 49
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
