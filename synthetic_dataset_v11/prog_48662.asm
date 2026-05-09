; DESCRIPTION: Renders a blue box of size 44x64 starting at (116, 19).
; PLAN: r0=116(x), r1=19(y), r2=44(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 19
LDI r2, 44
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
