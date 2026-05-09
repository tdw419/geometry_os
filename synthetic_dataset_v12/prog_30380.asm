; DESCRIPTION: Renders a cyan box of size 21x63 starting at (310, 31).
; PLAN: r0=310(x), r1=31(y), r2=21(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 31
LDI r2, 21
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
