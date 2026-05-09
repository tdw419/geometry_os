; DESCRIPTION: Renders a yellow box of size 67x32 starting at (229, 7).
; PLAN: r0=229(x), r1=7(y), r2=67(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 7
LDI r2, 67
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
