; DESCRIPTION: Renders a yellow box of size 67x55 starting at (50, 51).
; PLAN: r0=50(x), r1=51(y), r2=67(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 51
LDI r2, 67
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
