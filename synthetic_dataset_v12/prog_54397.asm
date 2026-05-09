; DESCRIPTION: Renders a yellow box of size 19x11 starting at (95, 236).
; PLAN: r0=95(x), r1=236(y), r2=19(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 236
LDI r2, 19
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
