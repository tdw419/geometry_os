; DESCRIPTION: Renders a cyan box of size 17x60 starting at (124, 50).
; PLAN: r0=124(x), r1=50(y), r2=17(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 50
LDI r2, 17
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
