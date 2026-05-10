; DESCRIPTION: Creates a purple filled rectangle of size 93x42 starting at (175, 115).
; PLAN: r0=175(x), r1=115(y), r2=93(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 115
LDI r2, 93
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
