; DESCRIPTION: Places a magenta 55x115 rectangle at position (363, 119).
; PLAN: r0=363(x), r1=119(y), r2=55(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 119
LDI r2, 55
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
