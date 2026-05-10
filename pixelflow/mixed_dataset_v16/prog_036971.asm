; DESCRIPTION: Renders a cyan box of size 110x120 starting at (354, 117).
; PLAN: r0=354(x), r1=117(y), r2=110(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 117
LDI r2, 110
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
