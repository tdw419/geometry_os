; DESCRIPTION: Places a magenta 120x98 rectangle at position (300, 44).
; PLAN: r0=300(x), r1=44(y), r2=120(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 44
LDI r2, 120
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
