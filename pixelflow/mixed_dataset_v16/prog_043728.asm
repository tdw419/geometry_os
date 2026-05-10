; DESCRIPTION: Creates a magenta filled rectangle of size 14x87 starting at (271, 192).
; PLAN: r0=271(x), r1=192(y), r2=14(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 192
LDI r2, 14
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
