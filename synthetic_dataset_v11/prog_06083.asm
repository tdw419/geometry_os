; DESCRIPTION: Renders a cyan box of size 70x63 starting at (150, 155).
; PLAN: r0=150(x), r1=155(y), r2=70(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 155
LDI r2, 70
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
