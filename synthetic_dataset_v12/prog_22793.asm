; DESCRIPTION: Renders a black box of size 90x103 starting at (50, 138).
; PLAN: r0=50(x), r1=138(y), r2=90(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 138
LDI r2, 90
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
