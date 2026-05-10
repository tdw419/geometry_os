; DESCRIPTION: Creates a magenta filled rectangle of size 50x48 starting at (333, 195).
; PLAN: r0=333(x), r1=195(y), r2=50(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 195
LDI r2, 50
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
