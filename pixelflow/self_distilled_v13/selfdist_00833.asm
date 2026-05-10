; DESCRIPTION: Renders a green rectangular region spanning 57 by 45 at (42, 30).
; PLAN: r0=42(x), r1=30(y), r2=57(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 30
LDI r2, 57
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
