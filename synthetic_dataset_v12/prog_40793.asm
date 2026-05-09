; DESCRIPTION: Renders a cyan box of size 13x21 starting at (424, 87).
; PLAN: r0=424(x), r1=87(y), r2=13(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 87
LDI r2, 13
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
