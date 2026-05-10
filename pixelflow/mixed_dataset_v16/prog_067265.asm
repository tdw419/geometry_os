; DESCRIPTION: Renders a black box of size 21x113 starting at (198, 106).
; PLAN: r0=198(x), r1=106(y), r2=21(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 106
LDI r2, 21
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
