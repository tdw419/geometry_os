; DESCRIPTION: Renders a white box of size 44x90 starting at (17, 35).
; PLAN: r0=17(x), r1=35(y), r2=44(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 35
LDI r2, 44
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
