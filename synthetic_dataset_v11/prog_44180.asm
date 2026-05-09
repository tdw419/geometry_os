; DESCRIPTION: Renders a black box of size 46x59 starting at (126, 192).
; PLAN: r0=126(x), r1=192(y), r2=46(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 192
LDI r2, 46
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
