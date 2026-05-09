; DESCRIPTION: Renders a cyan box of size 85x111 starting at (166, 87).
; PLAN: r0=166(x), r1=87(y), r2=85(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 87
LDI r2, 85
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
