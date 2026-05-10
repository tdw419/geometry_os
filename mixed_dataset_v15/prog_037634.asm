; DESCRIPTION: Renders a blue box of size 102x98 starting at (403, 5).
; PLAN: r0=403(x), r1=5(y), r2=102(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 5
LDI r2, 102
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
