; DESCRIPTION: Renders a cyan box of size 98x12 starting at (328, 3).
; PLAN: r0=328(x), r1=3(y), r2=98(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 3
LDI r2, 98
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
