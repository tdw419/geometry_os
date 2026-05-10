; DESCRIPTION: Renders a cyan box of size 63x96 starting at (166, 44).
; PLAN: r0=166(x), r1=44(y), r2=63(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 44
LDI r2, 63
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
