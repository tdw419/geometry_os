; DESCRIPTION: Renders a cyan box of size 75x49 starting at (151, 120).
; PLAN: r0=151(x), r1=120(y), r2=75(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 120
LDI r2, 75
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
