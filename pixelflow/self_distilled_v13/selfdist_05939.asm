; DESCRIPTION: Creates a red filled rectangle of size 99x113 starting at (253, 200).
; PLAN: r0=253(x), r1=200(y), r2=99(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 200
LDI r2, 99
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
