; DESCRIPTION: Renders a cyan box of size 15x85 starting at (150, 37).
; PLAN: r0=150(x), r1=37(y), r2=15(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 37
LDI r2, 15
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
