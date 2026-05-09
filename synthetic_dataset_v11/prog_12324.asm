; DESCRIPTION: Renders a cyan box of size 63x49 starting at (130, 83).
; PLAN: r0=130(x), r1=83(y), r2=63(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 83
LDI r2, 63
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
