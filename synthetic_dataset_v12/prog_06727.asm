; DESCRIPTION: Renders a green box of size 57x45 starting at (87, 150).
; PLAN: r0=87(x), r1=150(y), r2=57(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 150
LDI r2, 57
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
