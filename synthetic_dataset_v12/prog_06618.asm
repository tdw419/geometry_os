; DESCRIPTION: Renders a cyan box of size 89x42 starting at (309, 5).
; PLAN: r0=309(x), r1=5(y), r2=89(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 5
LDI r2, 89
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
