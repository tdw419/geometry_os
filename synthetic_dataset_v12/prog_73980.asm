; DESCRIPTION: Renders a purple box of size 87x115 starting at (398, 133).
; PLAN: r0=398(x), r1=133(y), r2=87(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 133
LDI r2, 87
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
