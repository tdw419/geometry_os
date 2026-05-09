; DESCRIPTION: Renders a yellow box of size 66x55 starting at (242, 67).
; PLAN: r0=242(x), r1=67(y), r2=66(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 67
LDI r2, 66
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
