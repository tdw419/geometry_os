; DESCRIPTION: Renders a black box of size 38x52 starting at (288, 16).
; PLAN: r0=288(x), r1=16(y), r2=38(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 16
LDI r2, 38
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
