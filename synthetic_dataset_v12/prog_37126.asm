; DESCRIPTION: Renders a yellow box of size 118x28 starting at (278, 228).
; PLAN: r0=278(x), r1=228(y), r2=118(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 228
LDI r2, 118
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
