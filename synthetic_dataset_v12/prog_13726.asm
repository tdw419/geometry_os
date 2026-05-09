; DESCRIPTION: Renders a yellow box of size 32x10 starting at (400, 210).
; PLAN: r0=400(x), r1=210(y), r2=32(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 210
LDI r2, 32
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
