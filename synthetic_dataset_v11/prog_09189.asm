; DESCRIPTION: Renders a cyan box of size 13x81 starting at (9, 30).
; PLAN: r0=9(x), r1=30(y), r2=13(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 30
LDI r2, 13
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
