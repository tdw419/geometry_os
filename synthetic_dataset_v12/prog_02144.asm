; DESCRIPTION: Renders a yellow box of size 69x47 starting at (328, 182).
; PLAN: r0=328(x), r1=182(y), r2=69(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 182
LDI r2, 69
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
