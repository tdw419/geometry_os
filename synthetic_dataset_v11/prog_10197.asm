; DESCRIPTION: Renders a yellow box of size 22x116 starting at (46, 95).
; PLAN: r0=46(x), r1=95(y), r2=22(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 95
LDI r2, 22
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
