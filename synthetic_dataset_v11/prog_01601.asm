; DESCRIPTION: Places a red 10x105 rectangle at position (177, 55).
; PLAN: r0=177(x), r1=55(y), r2=10(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 55
LDI r2, 10
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
