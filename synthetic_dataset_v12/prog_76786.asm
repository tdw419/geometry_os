; DESCRIPTION: Renders a black box of size 103x90 starting at (108, 144).
; PLAN: r0=108(x), r1=144(y), r2=103(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 144
LDI r2, 103
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
