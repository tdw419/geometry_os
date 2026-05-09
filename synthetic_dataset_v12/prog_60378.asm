; DESCRIPTION: Renders a cyan box of size 13x78 starting at (243, 159).
; PLAN: r0=243(x), r1=159(y), r2=13(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 159
LDI r2, 13
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
