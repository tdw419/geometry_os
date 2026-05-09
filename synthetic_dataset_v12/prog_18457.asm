; DESCRIPTION: Renders a purple box of size 102x10 starting at (392, 227).
; PLAN: r0=392(x), r1=227(y), r2=102(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 227
LDI r2, 102
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
