; DESCRIPTION: Renders a white box of size 65x115 starting at (42, 89).
; PLAN: r0=42(x), r1=89(y), r2=65(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 89
LDI r2, 65
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
