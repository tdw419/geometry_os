; DESCRIPTION: Renders a yellow box of size 16x29 starting at (29, 180).
; PLAN: r0=29(x), r1=180(y), r2=16(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 180
LDI r2, 16
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
