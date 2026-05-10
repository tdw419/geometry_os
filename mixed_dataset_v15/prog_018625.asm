; DESCRIPTION: Renders a cyan box of size 100x120 starting at (205, 57).
; PLAN: r0=205(x), r1=57(y), r2=100(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 57
LDI r2, 100
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
