; DESCRIPTION: Renders a yellow box of size 95x91 starting at (82, 67).
; PLAN: r0=82(x), r1=67(y), r2=95(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 67
LDI r2, 95
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
