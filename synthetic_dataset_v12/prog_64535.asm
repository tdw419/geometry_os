; DESCRIPTION: Renders a cyan box of size 109x16 starting at (63, 102).
; PLAN: r0=63(x), r1=102(y), r2=109(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 102
LDI r2, 109
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
