; DESCRIPTION: Renders a white box of size 38x46 starting at (174, 199).
; PLAN: r0=174(x), r1=199(y), r2=38(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 199
LDI r2, 38
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
