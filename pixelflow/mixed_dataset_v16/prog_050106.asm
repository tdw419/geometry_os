; DESCRIPTION: Places a orange 115x55 rectangle at position (3, 177).
; PLAN: r0=3(x), r1=177(y), r2=115(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 177
LDI r2, 115
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
