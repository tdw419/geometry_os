; DESCRIPTION: Renders a cyan box of size 42x66 starting at (296, 23).
; PLAN: r0=296(x), r1=23(y), r2=42(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 23
LDI r2, 42
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
