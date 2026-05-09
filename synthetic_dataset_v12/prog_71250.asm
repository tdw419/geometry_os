; DESCRIPTION: Places a magenta 65x44 rectangle at position (433, 77).
; PLAN: r0=433(x), r1=77(y), r2=65(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 77
LDI r2, 65
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
