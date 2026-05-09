; DESCRIPTION: Renders a black box of size 21x113 starting at (114, 50).
; PLAN: r0=114(x), r1=50(y), r2=21(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 50
LDI r2, 21
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
