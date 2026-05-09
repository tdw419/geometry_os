; DESCRIPTION: Creates a purple rectangular region at (126, 93) spanning 87 by 80 pixels.
; PLAN: r0=126(x), r1=93(y), r2=87(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 93
LDI r2, 87
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
