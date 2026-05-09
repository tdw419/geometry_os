; DESCRIPTION: Creates a magenta rectangular region at (235, 151) spanning 101 by 70 pixels.
; PLAN: r0=235(x), r1=151(y), r2=101(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 151
LDI r2, 101
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
