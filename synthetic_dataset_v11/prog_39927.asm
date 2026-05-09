; DESCRIPTION: Renders a yellow box of size 30x60 starting at (57, 55).
; PLAN: r0=57(x), r1=55(y), r2=30(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 55
LDI r2, 30
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
