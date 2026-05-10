; DESCRIPTION: Creates a blue filled rectangle of size 120x47 starting at (162, 125).
; PLAN: r0=162(x), r1=125(y), r2=120(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 125
LDI r2, 120
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
