; DESCRIPTION: Renders a black box of size 111x96 starting at (161, 146).
; PLAN: r0=161(x), r1=146(y), r2=111(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 146
LDI r2, 111
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
