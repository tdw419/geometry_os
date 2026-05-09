; DESCRIPTION: Renders a green box of size 76x100 starting at (197, 59).
; PLAN: r0=197(x), r1=59(y), r2=76(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 59
LDI r2, 76
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
