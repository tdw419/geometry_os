; DESCRIPTION: Renders a magenta box of size 40x29 starting at (198, 14).
; PLAN: r0=198(x), r1=14(y), r2=40(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 14
LDI r2, 40
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
