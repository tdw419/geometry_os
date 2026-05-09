; DESCRIPTION: Renders a white box of size 22x11 starting at (164, 186).
; PLAN: r0=164(x), r1=186(y), r2=22(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 186
LDI r2, 22
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
