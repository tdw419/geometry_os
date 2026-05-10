; DESCRIPTION: Creates a green filled rectangle of size 105x25 starting at (180, 103).
; PLAN: r0=180(x), r1=103(y), r2=105(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 103
LDI r2, 105
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
