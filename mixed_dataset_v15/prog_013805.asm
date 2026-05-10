; DESCRIPTION: Creates a purple filled rectangle of size 42x105 starting at (393, 15).
; PLAN: r0=393(x), r1=15(y), r2=42(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 15
LDI r2, 42
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
