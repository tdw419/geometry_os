; DESCRIPTION: Renders a cyan box of size 70x91 starting at (164, 147).
; PLAN: r0=164(x), r1=147(y), r2=70(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 147
LDI r2, 70
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
