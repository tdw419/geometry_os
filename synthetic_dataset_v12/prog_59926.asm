; DESCRIPTION: Renders a cyan box of size 87x74 starting at (150, 94).
; PLAN: r0=150(x), r1=94(y), r2=87(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 94
LDI r2, 87
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
