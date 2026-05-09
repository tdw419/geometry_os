; DESCRIPTION: Renders a purple box of size 87x61 starting at (305, 144).
; PLAN: r0=305(x), r1=144(y), r2=87(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 144
LDI r2, 87
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
