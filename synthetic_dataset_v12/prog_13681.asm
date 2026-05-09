; DESCRIPTION: Renders a yellow box of size 88x44 starting at (328, 143).
; PLAN: r0=328(x), r1=143(y), r2=88(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 143
LDI r2, 88
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
