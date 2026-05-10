; DESCRIPTION: Renders a cyan box of size 13x101 starting at (492, 91).
; PLAN: r0=492(x), r1=91(y), r2=13(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 91
LDI r2, 13
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
