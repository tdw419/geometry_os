; DESCRIPTION: Renders a yellow box of size 67x27 starting at (27, 192).
; PLAN: r0=27(x), r1=192(y), r2=67(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 192
LDI r2, 67
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
