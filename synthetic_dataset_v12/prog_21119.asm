; DESCRIPTION: Renders a black box of size 39x12 starting at (50, 180).
; PLAN: r0=50(x), r1=180(y), r2=39(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 180
LDI r2, 39
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
