; DESCRIPTION: Renders a yellow box of size 120x29 starting at (299, 134).
; PLAN: r0=299(x), r1=134(y), r2=120(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 134
LDI r2, 120
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
