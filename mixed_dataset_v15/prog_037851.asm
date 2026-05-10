; DESCRIPTION: Renders a cyan box of size 45x91 starting at (374, 49).
; PLAN: r0=374(x), r1=49(y), r2=45(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 49
LDI r2, 45
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
