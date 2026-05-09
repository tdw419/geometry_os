; DESCRIPTION: Renders a blue box of size 82x25 starting at (160, 223).
; PLAN: r0=160(x), r1=223(y), r2=82(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 223
LDI r2, 82
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
