; DESCRIPTION: Renders a yellow box of size 55x67 starting at (140, 57).
; PLAN: r0=140(x), r1=57(y), r2=55(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 57
LDI r2, 55
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
