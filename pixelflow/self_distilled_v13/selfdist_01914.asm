; DESCRIPTION: Creates a magenta filled rectangle of size 68x110 starting at (180, 42).
; PLAN: r0=180(x), r1=42(y), r2=68(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 42
LDI r2, 68
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
