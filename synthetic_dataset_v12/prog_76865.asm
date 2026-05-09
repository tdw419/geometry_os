; DESCRIPTION: Renders a cyan box of size 108x83 starting at (337, 63).
; PLAN: r0=337(x), r1=63(y), r2=108(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 63
LDI r2, 108
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
