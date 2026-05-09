; DESCRIPTION: Renders a cyan box of size 78x103 starting at (278, 85).
; PLAN: r0=278(x), r1=85(y), r2=78(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 85
LDI r2, 78
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
