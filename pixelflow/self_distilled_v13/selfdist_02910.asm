; DESCRIPTION: Creates a blue filled rectangle of size 57x106 starting at (365, 180).
; PLAN: r0=365(x), r1=180(y), r2=57(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 180
LDI r2, 57
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
