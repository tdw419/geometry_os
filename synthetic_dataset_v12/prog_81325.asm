; DESCRIPTION: Renders a cyan box of size 97x25 starting at (215, 130).
; PLAN: r0=215(x), r1=130(y), r2=97(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 130
LDI r2, 97
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
