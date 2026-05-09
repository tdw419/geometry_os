; DESCRIPTION: Renders a green box of size 29x34 starting at (327, 195).
; PLAN: r0=327(x), r1=195(y), r2=29(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 195
LDI r2, 29
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
