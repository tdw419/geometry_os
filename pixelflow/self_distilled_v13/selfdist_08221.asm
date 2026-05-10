; DESCRIPTION: Renders a purple rectangular region spanning 42 by 21 at (110, 195).
; PLAN: r0=110(x), r1=195(y), r2=42(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 195
LDI r2, 42
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
