; DESCRIPTION: Renders a green box of size 14x58 starting at (479, 12).
; PLAN: r0=479(x), r1=12(y), r2=14(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 12
LDI r2, 14
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
