; DESCRIPTION: Renders a cyan box of size 12x68 starting at (402, 127).
; PLAN: r0=402(x), r1=127(y), r2=12(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 127
LDI r2, 12
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
