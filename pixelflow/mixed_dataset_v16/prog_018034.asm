; DESCRIPTION: Renders a cyan box of size 91x30 starting at (110, 130).
; PLAN: r0=110(x), r1=130(y), r2=91(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 130
LDI r2, 91
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
