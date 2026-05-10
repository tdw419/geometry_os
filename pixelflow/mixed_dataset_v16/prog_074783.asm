; DESCRIPTION: Creates a green filled rectangle of size 50x90 starting at (270, 30).
; PLAN: r0=270(x), r1=30(y), r2=50(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 30
LDI r2, 50
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
