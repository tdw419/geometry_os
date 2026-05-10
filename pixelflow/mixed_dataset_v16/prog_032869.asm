; DESCRIPTION: Renders a cyan box of size 14x63 starting at (469, 84).
; PLAN: r0=469(x), r1=84(y), r2=14(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 84
LDI r2, 14
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
