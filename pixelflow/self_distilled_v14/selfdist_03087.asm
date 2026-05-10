; DESCRIPTION: Places a magenta 33x80 box at position (235, 149).
; PLAN: r0=235(x), r1=149(y), r2=33(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 149
LDI r2, 33
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
