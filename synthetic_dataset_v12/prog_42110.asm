; DESCRIPTION: Renders a white box of size 39x25 starting at (303, 165).
; PLAN: r0=303(x), r1=165(y), r2=39(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 165
LDI r2, 39
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
