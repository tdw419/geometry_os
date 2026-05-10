; DESCRIPTION: Creates a purple filled rectangle of size 99x117 starting at (235, 171).
; PLAN: r0=235(x), r1=171(y), r2=99(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 171
LDI r2, 99
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
