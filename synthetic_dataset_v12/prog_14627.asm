; DESCRIPTION: Renders a black box of size 55x59 starting at (441, 134).
; PLAN: r0=441(x), r1=134(y), r2=55(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 134
LDI r2, 55
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
