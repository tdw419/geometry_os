; DESCRIPTION: Renders a green box of size 50x75 starting at (52, 42).
; PLAN: r0=52(x), r1=42(y), r2=50(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 42
LDI r2, 50
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
