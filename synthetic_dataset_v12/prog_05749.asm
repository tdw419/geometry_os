; DESCRIPTION: Renders a black box of size 94x113 starting at (109, 60).
; PLAN: r0=109(x), r1=60(y), r2=94(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 60
LDI r2, 94
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
