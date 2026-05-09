; DESCRIPTION: Renders a white box of size 111x45 starting at (0, 134).
; PLAN: r0=0(x), r1=134(y), r2=111(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 134
LDI r2, 111
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
